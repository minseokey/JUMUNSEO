from fastapi import FastAPI, WebSocket
from fastapi.middleware.cors import CORSMiddleware

import json
import asyncio
from redis.asyncio import Redis
import uvicorn
import motor.motor_asyncio
import uuid
import gpt
import datetime
import os

app = FastAPI()

# CORS
# TODO: CORS 수정하기
origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Asyncio 이벤트 루프 생성
loop = asyncio.get_event_loop()

# MongoDB와의 연결 설정
MAGICIAN_MONGO_USERNAME = os.getenv("MAGICIAN_MONGO_USERNAME")
MAGICIAN_MONGO_PASSWORD = os.getenv("MAGICIAN_MONGO_PASSWORD")
MAGICIAN_MONGO_PORT = os.getenv("MAGICIAN_MONGO_PORT")
MAGICIAN_MONGO_HOST = os.getenv("MAGICIAN_MONGO_HOST")
db_name = "chat_db"
MONGO_URI = f"mongodb://{MAGICIAN_MONGO_USERNAME}:{MAGICIAN_MONGO_PASSWORD}@{MAGICIAN_MONGO_HOST}:{MAGICIAN_MONGO_PORT}/{db_name}?authSource=admin"
client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_URI)
db = client["chat_db"]  # MongoDB 데이터베이스 선택
collection = db["chats"]  # 채팅 내용을 저장할 컬렉션 선택

# 레디스 클라이언트 생성
redis = Redis(host=os.getenv("MAGICIAN_REDIS_HOST"), port=int(os.getenv("MAGICIAN_REDIS_PORT")))


# INPUT -> USERID
@app.websocket("/magician/ws/{user_id}")
async def websocket_endpoint(websocket: WebSocket, user_id: str):
    await websocket.accept()
    init = await websocket.receive_text()
    added_prompt, room_id = init.split("/")
    conversation = []
    is_continued = False

    try:
        # 사전정의된 프롬프트 받기, 이전 채팅방 이어하는지 여부 받기, 만약 새로 시작이라면 -1 보내기
        if room_id != "-1":
            is_continued = True

            # 이전 채팅 로딩
            chat = await collection.find_one({"room_id": room_id})

            # 이전 대화내용
            conversation = chat["conversation"]
            added_prompt = chat["added_prompt"]
            await websocket.send_json(chat["conversation"])

            # 이전 대화를 GPT에 입력, 문맥을 따라가도록
            await gpt.gpt_reload(chat["conversation"])
            await websocket.send_text("이전 대화를 이어서 진행합니다.")

        else:
            # 새로운 대화 시작
            is_continued = False
            room_id = str(uuid.uuid4())

        msg_history = []
        # 대화 시작
        while True:
            data = await websocket.receive_text()
            # 응답 생성 with added_prompt
            msg = await gpt.gpt_talk(" ".join(msg_history), data, added_prompt)
            # 문맥 유지
            msg_history .append(msg)
            await websocket.send_text(msg)
            conversation.append({"user_message": data, "bot_response": msg})

    except Exception as e:
        print(e)

    finally:
        await save_chat(user_id, room_id, added_prompt, conversation, is_continued)  # 대화 기록을 MongoDB에 저장


# 채팅 내용 저장 함수
async def save_chat(user_id, room_id, added_prompt, conversation, is_continued):
    if is_continued:
        await collection.update_one({"room_id": room_id}, {"$set": {"conversation": conversation}})
    else:
        chat_data = {"start_time": datetime.datetime.now(), "user_id": user_id, "room_id": room_id,
                     "added_prompt": added_prompt, "conversation": conversation}
        await collection.insert_one(chat_data)


@app.on_event("startup")
async def startup_event():
    asyncio.create_task(subscribe())


async def subscribe():
    # Pub/Sub 객체 생성
    pubsub = redis.pubsub()
    # 채널 구독
    await pubsub.subscribe('magician')

    async for message in pubsub.listen():
        # 메시지 유형 확인
        if message['type'] == 'message':
            await process_message(message['data'])


async def process_message(message):
    data = json.loads(message.decode('utf-8'))
    cmd = data['command']
    if cmd == "DeleteChat":
        await delete_chat(json.loads(data['data'])['room_id'])


# READ
# TODO: CQRS 패턴으로 변경
# 어떤 사용자가 진행했던 채팅들 리스트 반환
@app.get("/chat/list/{user_id}")
async def chat_list(user_id: str):
    chats = []
    async for chat in collection.find({"user_id": user_id}):
        chat["id"] = str(chat["_id"])
        chat.pop("_id")
        chats.append(chat)
    return chats


# READ
# TODO: CQRS 패턴으로 변경
# 어떤 채팅의 디테일 내용을 반환
@app.get("/chat/{room_id}")
async def chat_detail(room_id: str):
    chat = await collection.find_one({"room_id": room_id})
    if chat:
        chat["_id"] = str(chat["_id"])
        chat.pop("_id")
        return chat
    else:
        return None


# DELETE
# 채팅방의 채팅 내용 삭제
async def delete_chat(room_id: str):
    # TODO: 어플리케이션 기능은 완성. but 로깅은 어떻게하지?
    await collection.delete_one({"room_id": room_id})


# FastAPI 서버 실행
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
