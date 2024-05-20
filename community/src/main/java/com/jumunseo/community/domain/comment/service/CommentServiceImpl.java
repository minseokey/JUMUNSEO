package com.jumunseo.community.domain.comment.service;

import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.board.repository.BoardRepository;
import com.jumunseo.community.domain.comment.dto.CommentMapper;
import com.jumunseo.community.domain.comment.dto.CommentRequestDto;
import com.jumunseo.community.domain.comment.dto.CommentResponseDto;
import com.jumunseo.community.domain.comment.entity.Comment;
import com.jumunseo.community.domain.comment.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService{

    private final CommentRepository commentRepository;
    private final BoardRepository boardRepository;
    private final CommentMapper mapper;
    @Override
    @Transactional
    public void createComment(CommentRequestDto commentRequestDto) {
        Comment comment = mapper.requestToEntity(commentRequestDto);
        Comment savedComment = commentRepository.save(comment);

        if (commentRequestDto.getHeadCommentId() == -1L) {
            savedComment.setHeadCommentId(savedComment.getId()); // 대댓글이 아닌 경우 headCommentId를 자신의 id로 설정
        }
        else {
            if (commentRepository.findById(commentRequestDto.getHeadCommentId()).isEmpty()) {
                throw new IllegalArgumentException("해당 대댓글이 존재하지 않습니다.");
            }
            savedComment.setHeadCommentId(commentRequestDto.getHeadCommentId());
        }
    }

    @Override
    @Transactional
    public void deleteComment(Long commentId, String email) {
        Comment comment = commentRepository.findById(commentId).orElseThrow(
                () -> new IllegalArgumentException("해당 댓글이 존재하지 않습니다.")
        );
        if (!comment.getUserId().equals(email)) {
            throw new IllegalArgumentException("해당 댓글을 삭제할 권한이 없습니다.");
        }
        // 연결된 대댓글 삭제
        commentRepository.deleteAllByHeadCommentId(commentId);
        // 댓글 삭제
        commentRepository.delete(comment);
    }

    @Override
    @Transactional
    public List<CommentResponseDto> getCommentList(Long boardId) {
        Board board = boardRepository.findById(boardId).orElseThrow(
                () -> new IllegalArgumentException("해당 게시글이 존재하지 않습니다.")
        );
        List<Comment> comment = commentRepository.findAllByBoardOrderByHeadCommentId(board);
        List<CommentResponseDto> commentResponseDtoList = new ArrayList<>();
        for (Comment c : comment) {
            commentResponseDtoList.add(mapper.entityToResponse(c));
        }
        return commentResponseDtoList;
    }
}
