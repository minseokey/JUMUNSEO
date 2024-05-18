import openai
from openai import OpenAI
from pathlib import Path

client = OpenAI(api_key="")

def fine_tune(train_file_id):
    try:
        # 파인 튜닝 작업을 생성하고 결과를 저장합니다.
        fine_tune_job = client.fine_tuning.jobs.create(
            model="gpt-3.5-turbo",
            training_file=train_file_id,
        )

        # 생성된 파인 튜닝 작업의 ID를 사용하여 상태를 검색합니다.
        job_id = fine_tune_job.id  # 작업 ID를 얻습니다.
        print(f"Fine-tune job ID: {job_id}")  # 작업 ID를 출력합니다.

        # 작업 ID를 사용하여 파인 튜닝 작업의 상태를 검색합니다.
        job_status = client.fine_tuning.jobs.retrieve(job_id)
        print(job_status)  # 작업 상태를 출력합니다.

    except openai.APIConnectionError as e:
        print("연결 에러")
        print(e.__cause__)
    except openai.RateLimitError as e:
        print("과부화")
    except openai.APIStatusError as e:
        print("모르는 에러...")
        print(e.status_code)
        print(e.response)


category = ["01.민사", "02.형사", "03.행정"]
year = ["2017", "2018", "2019", "2020", "2021"]

file = client.files.create(
    file=Path(""),
    purpose="fine-tune"
)
fine_tune(file.id)