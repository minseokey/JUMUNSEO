package com.jumunseo.community.domain.comment.dto;

import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.board.repository.BoardRepository;
import com.jumunseo.community.domain.comment.entity.Comment;
import com.jumunseo.community.domain.comment.exceptions.NoBoardException;
import com.jumunseo.community.domain.comment.exceptions.NoCommentException;
import com.jumunseo.community.domain.comment.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentMapper {

    private final BoardRepository boardRepository;
    private final CommentRepository commentRepository;

    public Comment requestToEntity(CommentRequestDto commentRequestDto) {
        Board board = boardRepository.findById(commentRequestDto.getBoardId()).orElseThrow(
                () -> new NoBoardException("해당 게시글이 존재하지 않습니다."));

        return Comment.builder()
                .userId(commentRequestDto.getUserId())
                .content(commentRequestDto.getContent())
                .board(board)
                .build();
    }

    public CommentResponseDto entityToResponse(Comment comment) {
        return CommentResponseDto.builder()
                .id(comment.getId())
                .userId(comment.getUserId())
                .content(comment.getContent())
                .headCommentId(comment.getHeadCommentId())
                .build();
    }
}
