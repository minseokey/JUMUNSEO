# DEBATE-SERVER
## 토론서버 입니다.

---
### how to test
> 1. Docker-Compose 에 OpenAI Key 를 넣어줍니다. 나머지는 Test 용 설정 해두었습니다.
> 2. debate 폴더로 이동합니다.
> 3. docker-compose -f debate-env-docker-compose.yml up 를 실행합니다 (혹시 안되면 sudo 를 붙여주세요, 그래도 안된다면 PC 의 docker 상태를 확인해주세요)
> 4. :8082 포트로 접속후 노션에 정의해놓은 end-point 참고하여 테스트 하시면 됩니다.
> 5. STOMP 관련한 테스트는 apic (https://apic.app/online/#/tester) 이용해주세요.