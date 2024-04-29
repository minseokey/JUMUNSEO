package com.jumunseo.compositeservice.query.controller;

import com.jumunseo.compositeservice.global.exception.Result;
import com.jumunseo.compositeservice.global.exception.WebClient4xxException;
import com.jumunseo.compositeservice.global.exception.WebClient5xxException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;


@RequiredArgsConstructor
@RequestMapping("/query/magician")
@Controller
public class MagicianQueryController {
    private final String MAGICIN_SERVICE_URL = "http://localhost:8000";
    private final WebClient webClient;

    // Flux
    // 유저 이름에 맞는 채팅방 리스트 가져오기
    @GetMapping("/list/{user_id}")
    public ResponseEntity<Result<?>> get_by_userId(HttpServletRequest req, @PathVariable String user_id) {
        Flux<JSONObject> flux = webClient.get()
                .uri(MAGICIN_SERVICE_URL + "/chat/list/" + user_id)
                .header("email", req.getAttribute("email").toString())
                .header("role", req.getAttribute("role").toString())
                .header("name", req.getAttribute("name").toString())
                .retrieve()
                // 4-- 에러 -> 요청 오류
                .onStatus(HttpStatusCode::is4xxClientError, res -> Mono.error(
                        new WebClient4xxException(res.bodyToMono(String.class).toString())
                ))
                // 5-- 에러 -> 시스템 오류
                .onStatus(HttpStatusCode::is5xxServerError, res -> Mono.error(
                        new WebClient5xxException(res.bodyToMono(String.class).toString())
                ))
                .bodyToFlux(JSONObject.class);

        List<JSONObject> chatlist = flux.collectList().block();
        return ResponseEntity.ok(Result.successResult(chatlist));
    }

    // Mono
    // 채팅방 아이디에 맞는 채팅방 가져오기
    @GetMapping("/{room_id}")
    public ResponseEntity<Result<?>> get_by_roomId(HttpServletRequest req, @PathVariable String room_id) {
        Mono<JSONObject> mono = webClient.get()
                .uri(MAGICIN_SERVICE_URL + "/chat/" + room_id)
                .header("email", req.getAttribute("email").toString())
                .header("role", req.getAttribute("role").toString())
                .header("name", req.getAttribute("name").toString())
                .retrieve()
                // 4-- 에러 -> 요청 오류
                .onStatus(HttpStatusCode::is4xxClientError, res -> Mono.error(
                        new WebClient4xxException(res.bodyToMono(String.class).toString())
                ))
                // 5-- 에러 -> 시스템 오류
                .onStatus(HttpStatusCode::is5xxServerError, res -> Mono.error(
                        new WebClient5xxException(res.bodyToMono(String.class).toString())
                ))
                .bodyToMono(JSONObject.class);

        return ResponseEntity.ok(Result.successResult(mono.block()));
    }
}
