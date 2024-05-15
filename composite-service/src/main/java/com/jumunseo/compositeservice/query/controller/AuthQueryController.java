package com.jumunseo.compositeservice.query.controller;

import com.jumunseo.compositeservice.global.exception.Result;
import com.jumunseo.compositeservice.global.exception.WebClient4xxException;
import com.jumunseo.compositeservice.global.exception.WebClient5xxException;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
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
@Controller
@RequestMapping("/query/auth")
@Tag(name = "Auth Query", description = "인증 서비스를 위한 쿼리 컨트롤러")
public class AuthQueryController {
    private final String AUTH_SERVICE_URL = "http://auth-server.auth:8080";
    private final WebClient webClient;
    // UserId로 User 정보 가져오기
    // 토큰 필요? 일단 X
    // mono
    @Tag(name = "Auth Query")
    @GetMapping("/info/{userId}")
    @Operation(summary = "Get User Info By UserId", description = "유저 정보를 유저 아이디를 통해 가져오는 메소드")
    public ResponseEntity<Result<?>> get_userInfo_by_userId(@PathVariable Long userId) {
        Mono<JSONObject> mono = webClient.get()
                .uri(AUTH_SERVICE_URL + "/user/info/" + userId)
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
    // Email로 User 정보 가져오기
    // 토큰 필요? 일단 X
    // mono
    @Tag(name = "Auth Query")
    @GetMapping("/info/email/{email}")
    @Operation(summary = "Get User Info By Email", description = "유저 정보를 이메일을 통해 가져오는 메소드")
    public ResponseEntity<Result<?>> get_userInfo_by_email(@PathVariable String email) {
        Mono<JSONObject> mono = webClient.get()
                .uri(AUTH_SERVICE_URL + "/user/info/email/" + email)
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
    // UserID들을 이용하여 User 정보들을 가져오기
    // 토큰 필요? 일단 X
    // flux
    @Tag(name = "Auth Query")
    @GetMapping("/info/users/{userIds}")
    @Operation(summary = "Get User Infos By UserIds", description = "유저 정보들을 유저 아이디 리스트를 통해 가져오는 메소드")
    public ResponseEntity<Result<?>> getUserInfoByUserIds(@PathVariable List<Long> userIds) {
        Flux<JSONObject> flux = webClient.get()
                .uri(AUTH_SERVICE_URL + "/user/info/users/" + userIds)
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

        List<JSONObject> userlist = flux.collectList().block();
        return ResponseEntity.ok(Result.successResult(userlist));
    }
}
