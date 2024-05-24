package com.jumunseo.compositeservice.query.controller;

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

@RequiredArgsConstructor
@RequestMapping("/query/debate")
@Tag(name = "Debate Query", description = "토론 서비스를 위한 쿼리 컨트롤러")
@Controller
public class DebateQueryController {

    @Value("${address.debate}")
    private String DEBATE_SERVICE_URL;
    private final WebClient webClient;

    // 해당 주제의 이전 채팅 조회 로그인 필요 X
    // flux
    @GetMapping("/{subjectId}/{last}")
    @Tag(name = "Debate Query")
    @Operation(summary = "Get Chat", description = "주제의 이전 채팅을 조회하는 메소드")
    public ResponseEntity<Result<?>> get_by_subject_opinion(HttpServletRequest req, @PathVariable String subjectId, @PathVariable Long last) {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/opinion/" + subjectId + "/" + last)
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

        JSONObject chatlist = mono.block();
        return ResponseEntity.ok(Result.successResult(chatlist.get("data")));
    }

    // 해당 주제의 지신의(토큰기반) 좌우 투표 기록.
    // 로그인 필요 O
    // mono
    @GetMapping("/side/{subjectId}")
    @Secured("USER")
    @Tag(name = "Debate Query")
    @Operation(summary = "Get Side History", description = "주제의 지신의 좌우 투표 기록을 조회하는 메소드")
    public ResponseEntity<Result<?>> get_side_history_from_before(HttpServletRequest req, @PathVariable String subjectId) {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/opinion/side/" + subjectId + "/" + req.getAttribute("email"))
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

        return ResponseEntity.ok(Result.successResult(mono.block().get("data")));
    }

    // 사용 가능한 주제 조회
    // flux
    // 로그인 필요 X
    @Tag(name = "Debate Query")
    @Operation(summary = "Get Available Subject", description = "사용 가능한 주제를 조회하는 메소드")
    @GetMapping("/available")
    public ResponseEntity<Result<?>> get_available_subject(HttpServletRequest req) {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/subject/available")
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

        JSONObject subjectlist = mono.block();
        return ResponseEntity.ok(Result.successResult(subjectlist.get("data")));
    }

    // 채팅 요약본 조회
    // mono
    // 로그인 필요 X
    @Tag(name = "Debate Query")
    @Operation(summary = "Get Chat Summary", description = "요약본을 조회하는 메소드")
    @GetMapping("/summary/{id}")
    public ResponseEntity<Result<?>> get_chat_summary(HttpServletRequest req, @PathVariable Long id) {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/subject/summary/" + id)
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

        return ResponseEntity.ok(Result.successResult(mono.block().get("data")));
    }

    // 요약본 조회 for method
    public JSONObject get_chat_summary_method(HttpServletRequest req, Long id) {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/subject/summary/" + id)
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

    // 최신 요약본 조회
    public JSONObject get_chat_summary_latest_method() {
        Mono<JSONObject> mono = webClient.get()
                .uri(DEBATE_SERVICE_URL + "/debate/subject/summary/latest")
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
