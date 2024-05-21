package com.jumunseo.community.domain.comment.service;

import com.jumunseo.community.domain.comment.dto.CommentRequestDto;
import com.jumunseo.community.domain.comment.dto.CommentResponseDto;

import java.util.List;

public interface CommentService {

    // 1. 댓글 등록
    void createComment(CommentRequestDto commentRequestDto);
    // 2. 댓글 삭제
    void deleteComment(Long commentId, String email);
    // 3. 댓글 리스트 조회
    List<CommentResponseDto> getCommentList(Long boardId);
}
