package com.jumunseo.debate.global.open_ai;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.debate.global.dto.CompletionRequest;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import com.jumunseo.debate.global.exception.CustomException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Service
public class OpenAIService {

    @Value("${openai.api.url}")
    private String API_URL;

    private final WebClient webClient;
    private final ObjectMapper objectMapper;

    // GPT-3에 요청을 보내는 메소드, message에 요청할 문장을 넣으면 GPT-3에서 응답한 결과를 반환
    public String sendRequest(String message) {
        Mono<JSONObject> mono = webClient.post()
                .uri(API_URL)
                .bodyValue(new CompletionRequest(message))
                .retrieve()
                .onStatus(HttpStatusCode::is4xxClientError, res -> Mono.error(
                        new CustomException(HttpStatus.valueOf(res.statusCode().value()),
                                res.bodyToMono(String.class).toString())
                ))
                .onStatus(HttpStatusCode::is5xxServerError, res -> Mono.error(
                        new CustomException(HttpStatus.valueOf(res.statusCode().value()),
                                res.bodyToMono(String.class).toString())
                ))
                .bodyToMono(JSONObject.class);
        JSONObject response = mono.block();
        try {
            Map<String,List<Map<String,Object>>>resultMap = objectMapper.readValue(response.toJSONString(), Map.class);
            return resultMap.get("choices").get(0).get("text").toString();
        }
        catch (NullPointerException e) {
            throw new CustomException(HttpStatus.NO_CONTENT, "GPT로부터 응답이 없습니다.");
        } catch (JsonMappingException e) {
            System.out.println("이거야?");
            throw new CustomException(HttpStatus.BAD_REQUEST, "GPT로부터 응답 처리 중 오류가 발생했습니다.");
        } catch (JsonProcessingException e) {
            throw new CustomException(HttpStatus.NO_CONTENT, "GPT로부터 응답 처리 없습니다.");
        }
    }
}
