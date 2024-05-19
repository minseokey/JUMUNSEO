package com.jumunseo.compositeservice.query.controller;

import com.jumunseo.compositeservice.global.exception.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.client.WebClient;

@RequiredArgsConstructor
@Controller
@RequestMapping("/query/community")
@Tag(name = "Communinty Query", description = "커뮤니티 서비스를 위한 쿼리 컨트롤러")
public class CommunityQueryController {
    @Value("${address.community}")
    private String COMMUNITY_URL;
    private final WebClient webClient;

    // 커뮤니티 목록 조회
    @GetMapping("/list")
    @Tag(name = "Community Query")
    @Operation(summary = "Community List", description = "커뮤니티 목록 조회")
    private ResponseEntity<Result<?>> getCommunityList() {
        return ResponseEntity.ok(null);
    }

    // 커뮤니티 목록 조회 with 카테고리
    @GetMapping("/list/{category}")
    @Tag(name = "Community Query")
    @Operation(summary = "Community List with Category", description = "카테고리별 커뮤니티 목록 조회")
    private ResponseEntity<Result<?>> getCommunityListWithCategory() {
        return ResponseEntity.ok(null);
    }


    // 커뮤니티 상세 조회 -> 마법사 or 토론 요약 or 바닐라
    @GetMapping("/detail/{id}")
    @Tag(name = "Community Query")
    @Operation(summary = "Community Detail", description = "커뮤니티 상세 조회")
    private ResponseEntity<Result<?>> getCommunityDetail() {
        return ResponseEntity.ok(null);
    }


    // 댓글 리스트 조회
    @GetMapping("/comment/list/{id}")
    @Tag(name = "Community Query")
    @Operation(summary = "Comment List", description = "댓글 리스트 조회")
    private ResponseEntity<Result<?>> getCommentList() {
        return ResponseEntity.ok(null);
    }


}
