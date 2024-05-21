package com.jumunseo.community.domain.comment.controller;

import com.jumunseo.community.domain.comment.service.CommentService;
import com.jumunseo.community.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/comment")
@RequiredArgsConstructor
public class CommentQueryController {

    private final CommentService commentService;
    // 댓글 리스트 조회
    @GetMapping("/list/{boardId}")
    public ResponseEntity<Result<?>> getCommentList(@PathVariable Long boardId) {
        return ResponseEntity.ok().body(Result.successResult(commentService.getCommentList(boardId)));
    }
}
