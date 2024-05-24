from pathlib import Path
import json

# 데이터 편집 코드
# assrs- > 주장
# facts -> 사실
# dcss -> 판단
# close -> 결론

# 데이터 흐름 -> 주장 + 사실 = 결론
# GPT에 적용? -> prompt(주장 + 사실) -> GPT -> 결론

category = ["01.민사", "02.형사", "03.행정"]
year = ["2017", "2018", "2019", "2020", "2021"]

for i in category:
    for j in year:
        file = Path(i + "/" + j)
        new_file = Path(i + "_edit" + "/" + j + ".jsonl")
        new_file.parent.mkdir(parents=True, exist_ok=True)

        combined_data = []

        # 새로운 파일이 존재하면 기존 데이터를 읽어오기
        if new_file.exists():
            with open(new_file, "r", encoding="utf-8") as ff:
                for line in ff:
                    combined_data.append(json.loads(line))

        for k in file.iterdir():
            with open(k, "r", encoding="utf-8") as f:
                data = json.load(f)
                new_data = dict()
                new_data["messages"] = []

                # 시스템 프롬프트 (system)
                system = {"role": "system", "content": "너는 판례를 이용해 사람들을 도와주는 인공지능이야"}
                new_data["messages"].append(system)

                # 주장 + 사실 (user)
                user = {"role": "user", "content": " ".join(["배경사실:"] + data["facts"]["bsisFacts"] + [
                    "원고측 주장:"] + data["assrs"]["acusrAssrs"] + ["피고측 주장:"] + data["assrs"]["dedatAssrs"])}
                new_data["messages"].append(user)

                # 결과 (assistant)
                assistant = {"role": "assistant", "content": " ".join(["판결:"] + data["close"]["cnclsns"])}
                new_data["messages"].append(assistant)

                combined_data.append(new_data)

        # 최종 데이터를 새로운 파일에 저장
        with open(new_file, "w", encoding="utf-8") as ff:
            for item in combined_data:
                ff.write(json.dumps(item, ensure_ascii=False) + "\n")
