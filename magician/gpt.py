import os
from openai import OpenAI

GPTKEY = os.getenv("OPENAI_KEY")
client = OpenAI(api_key=GPTKEY)


# Todo: prompt_engineering

async def gpt_talk(msg_history, msg, additional_prompt=""):
    try:
        response = client.chat.completions.create(model="ft:gpt-3.5-turbo-0125:personal::9Q8xPZMC",
                                                  messages=[
                                                      {"role": "system",
                                                       "content": "너는 한국의 법령과 판례를 이용해서 고객을 도와주는 법조인이야,"
                                                                  " 법을 잘 모르는 한국인을 대상으로 법적인 도움을 주는" +
                                                                  additional_prompt + "형식으로 대답해줘"},
                                                      {"role": "user", "content": " 이전에 대화한 내용은 다음과 같아: " + msg_history},
                                                      {"role": "user", "content": msg}
                                                  ])
        answer = response.choices[0].message.content
        return answer

    except Exception as e:
        print(e)
        return None


async def gpt_reload(msg):
    try:
        client.chat.completions.create(model="ft:gpt-3.5-turbo-0125:personal::9Q8xPZMC",
                                       messages=[
                                           {"role": "system",
                                            "content": "너는 한국의 법령과 판례를 이용해서 수임자를 도와주는 법조인이야,"
                                                       " 법을 잘 모르는 한국인을 대상으로 도움을 주는. 이번 대화는 이전 대화를 이어서 진행할거야"
                                                       "이 대화의 답을 할 필요 없어"},
                                           {"role": "user", "content": " 이전에 대화한 내용은 다음과 같아: " + msg}])
    except Exception as e:
        print(e)