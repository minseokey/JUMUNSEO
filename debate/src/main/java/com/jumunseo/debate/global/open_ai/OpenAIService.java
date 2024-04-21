package com.jumunseo.debate.global.open_ai;


import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.debate.global.dto.openai.ChatRequest;
import com.jumunseo.debate.global.dto.openai.ChatResponse;
import com.jumunseo.debate.global.exception.NoResponseException;
import com.jumunseo.debate.global.exception.WebClient4xxException;
import com.jumunseo.debate.global.exception.WebClient5xxException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import com.jumunseo.debate.global.exception.CustomException;

import java.util.List;

@RequiredArgsConstructor
@Service
public class OpenAIService {

    @Value("${openai.api.url}")
    private String API_URL;

    private final WebClient webClient;

    // GPT에 요청을 보내는 메소드, message에 요청할 문장을 넣으면 GPT-3에서 응답한 결과를 반환
    public String sendRequest(List<String> messages, String sysMessage) {
        Mono<ChatResponse> mono = webClient.post()
                .uri(API_URL)
                .bodyValue(new ChatRequest(messages, sysMessage))
                .retrieve()
                .onStatus(HttpStatusCode::is4xxClientError, res -> Mono.error(
                        new WebClient4xxException(res.bodyToMono(String.class).toString())
                ))
                .onStatus(HttpStatusCode::is5xxServerError, res -> Mono.error(
                        new WebClient5xxException(res.bodyToMono(String.class).toString())
                ))
                .bodyToMono(ChatResponse.class);
        ChatResponse response = mono.block();
        try {
            return response.getChoices().get(0).getMessage().getContent();
        }
        catch (NullPointerException e) {
            throw new NoResponseException("GPT로부터 응답이 없습니다.");
        }
    }
}
