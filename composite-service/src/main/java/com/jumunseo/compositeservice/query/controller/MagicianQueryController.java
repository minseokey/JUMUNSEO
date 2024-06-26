package com.jumunseo.compositeservice.query.controller;

import com.jumunseo.compositeservice.global.exception.JsonParsingException;
import com.jumunseo.compositeservice.global.exception.Result;
import com.jumunseo.compositeservice.global.exception.WebClient4xxException;
import com.jumunseo.compositeservice.global.exception.WebClient5xxException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.Map;


@RequiredArgsConstructor
@RequestMapping("/query/magician")
@Controller
@Tag(name = "Magician Query", description = "마법사 서비스를 위한 쿼리 컨트롤러")
public class MagicianQueryController {

    @Value("${address.magician}")
    private String MAGICIN_SERVICE_URL;
    private final WebClient webClient;

    // Flux
    // 유저 이름에 맞는 채팅방 리스트 가져오기
    // 로그인 O
    @Tag(name = "Magician Query")
    @Operation(summary = "Get Chat List", description = "유저 이름에 맞는 채팅방 리스트를 조회하는 메소드")
    @GetMapping("/list")
    @Secured("USER")
    public ResponseEntity<Result<?>> get_by_userId(HttpServletRequest req) {
        Flux<JSONObject> flux = webClient.get()
                .uri(MAGICIN_SERVICE_URL + "/chat/list/" + req.getAttribute("email").toString())
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
    // 로그인 필요 O
    @GetMapping("/{room_id}")
    @Secured("USER")
    @Tag(name = "Magician Query")
    @Operation(summary = "Get Chat", description = "채팅방을 조회하는 메소드")
    public ResponseEntity<Result<?>> get_by_roomId(HttpServletRequest req, @PathVariable String room_id) {
        Mono<JSONObject> mono = webClient.get()
                .uri(MAGICIN_SERVICE_URL + "/chat/" + room_id)
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

    public JSONObject get_by_roomId_method(HttpServletRequest req, String room_id) {
        Mono<JSONObject> mono = webClient.get()
                .uri(MAGICIN_SERVICE_URL + "/chat/" + room_id)
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

        return mono.block();
    }
}
