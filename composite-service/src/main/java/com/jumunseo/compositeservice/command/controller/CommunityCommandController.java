package com.jumunseo.compositeservice.command.controller;

import com.jumunseo.compositeservice.command.service.RedisService;
import com.jumunseo.compositeservice.global.exception.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/command/community")
@Tag(name = "Community Command", description = "커뮤니티 서비스를 위한 커맨드 컨트롤러")
public class CommunityCommandController {
    private final RedisService redisService;

    // 글 생성
    @PostMapping("/board/create")
    @Tag(name = "Community Command")
    @Operation(summary = "Posting Create", description = "게시글 생성 메소드")
    public ResponseEntity<Result<?>> createBoard(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }

    // 글 삭제
    @PostMapping("/board/delete")
    @Tag(name = "Community Command")
    @Operation(summary = "Posting Delete", description = "게시글 삭제 메소드")
    public ResponseEntity<Result<?>> deleteBoard(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }


    // 글 수정
    @PostMapping("/board/update")
    @Tag(name = "Community Command")
    @Operation(summary = "Posting Update", description = "게시글 수정 메소드")
    public ResponseEntity<Result<?>> updateBoard(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }

    // 글 좋아요(토글)
    @PostMapping("/board/like")
    @Tag(name = "Community Command")
    @Operation(summary = "Posting Like", description = "게시글 좋아요 토글 메소드")
    public ResponseEntity<Result<?>> toggleLike(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }


    // 댓글 생성
    @PostMapping("/comment/create")
    @Tag(name = "Community Command")
    @Operation(summary = "Comment Create", description = "댓글 생성 메소드")
    public ResponseEntity<Result<?>> createComment(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }

    // 댓글 삭제
    @PostMapping("/comment/delete")
    @Tag(name = "Community Command")
    @Operation(summary = "Comment Delete", description = "댓글 삭제 메소드")
    public ResponseEntity<Result<?>> deleteComment(HttpServletRequest request) {
        return ResponseEntity.ok(Result.successResult(null));
    }
}
