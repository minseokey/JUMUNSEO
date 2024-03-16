import os
from openai import OpenAI

GPTKEY = os.getenv("OPENAI_KEY")
client = OpenAI(api_key=GPTKEY)


# Todo: prompt_engineering

async def gpt_talk(msg, additional_prompt=""):
    try:
        response = client.chat.completions.create(model="gpt-3.5-turbo",
                                                  messages=[
                                                      {"role": "system",
                                                       "content": "너는 한국의 법령과 판례를 이용해서 고객을 도와주는 법조인이야,"
                                                                  " 법을 잘 모르는 한국인을 대상으로 도움을 주는" +
                                                                  additional_prompt + "형식으로 대답해줘"},
                                                      {"role": "user", "content": msg}
                                                  ])
        answer = response.choices[0].message.content
        return answer

    except Exception as e:
        print(e)
        return None