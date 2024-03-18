import pytest
from fastapi.testclient import TestClient
from main import app
import motor.motor_asyncio
import asyncio
import os

MONGO_URI = os.getenv("MONGO_URI")


@pytest.fixture(scope="module")
def chat_collection():
    M_Client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_URI)
    db = M_Client["chat_db"]
    collection = db["chats"]
    yield collection
    M_Client.close()


@pytest.fixture(scope="module")
def client():
    with TestClient(app) as client:
        yield client


@pytest.fixture(scope="module")
def event_loop():
    loop = asyncio.get_event_loop()
    yield loop
    loop.close()

# 1. GPT 로 전송, 답이 잘 오는지
@pytest.mark.asyncio
async def test_gpt(chat_collection, client):
    # userid -> 1 로 테스트 진행.
    with client.websocket_connect("/ws/Test1") as websocket:
        websocket.send_text("test/-1")
        websocket.send_text("테스트중이야, 안녕이라고 딱 두글자만 문장부호 없이 대답해줘")
        msg = websocket.receive_text()
        websocket.close()

    await asyncio.sleep(2)
    await chat_collection.delete_many({"user_id": "Test1"})
    assert msg == "안녕"

# 2. 처음 시작하는 방이 없을떄 (-1)
@pytest.mark.asyncio
# 대화종료후 메시지를 잘 저장하는지
async def test_end_of_message(chat_collection, client):
    with client.websocket_connect("/ws/Test2") as websocket:
        websocket.send_text("test/-1")
        websocket.send_text("all_저장테스트")
        websocket.close()

    # 웹소켓이 닫히고 5초 대기
    await asyncio.sleep(3)

    result = await chat_collection.find_one({"user_id": "Test2"})
    await chat_collection.delete_many({"user_id": "Test2"})
    assert result["conversation"][-1]["user_message"] == "all_저장테스트"
