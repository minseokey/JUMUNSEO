from fastapi import FastAPI, WebSocket
import asyncio
import uvicorn
import motor.motor_asyncio
import uuid
import gpt

app = FastAPI()

# Asyncio 이벤트 루프 생성
loop = asyncio.get_event_loop()

# MongoDB와의 연결 설정
MONGO_URI = os.getenv("MONGO_URI")
client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_URI)
db = client["chat_db"]  # MongoDB 데이터베이스 선택
collection = db["chats"]  # 채팅 내용을 저장할 컬렉션 선택

# INPUT -> USERID
@app.websocket("/ws/{user_id}")
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

        # 대화 시작
        while True:
            data = await websocket.receive_text()
            # 응답 생성 with added_prompt
            msg = await gpt.gpt_talk(data, added_prompt)
            await websocket.send_text(msg)
            conversation.append({"user_message": data, "bot_response": msg})

    except Exception as e:
        print(e)

    finally:
        await save_chat(user_id, room_id, added_prompt, conversation, is_continued)  # 대화 기록을 MongoDB에 저장

# 채팅 내용 저장 함수
async def save_chat(user_id, room_id,added_prompt, conversation, is_continued):
    pass

# READ
# 어떤 사용자가 진행했던 채팅들 리스트 반환
@app.get("/chat/list/{user_id}")
async def chat_list(user_id: str):
    return None


# READ
# 어떤 채팅의 디테일 내용을 반환
@app.get("/chat/{room_id}")
async def chat_detail(room_id: str):
    return None


# FastAPI 서버 실행
if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)