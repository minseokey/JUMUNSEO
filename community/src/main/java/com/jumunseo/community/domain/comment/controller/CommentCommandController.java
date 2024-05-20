package com.jumunseo.community.domain.comment.controller;

import com.jumunseo.community.domain.comment.dto.CommentRequestDto;
import com.jumunseo.community.domain.comment.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class CommentCommandController {
    private final CommentService commentService;

    // 생성
    public void createComment(CommentRequestDto commentRequestDto) {
        commentService.createComment(commentRequestDto);
    }
    // 삭제
    public void deleteComment(Long commentId, String email) {
        commentService.deleteComment(commentId, email);
    }
}
