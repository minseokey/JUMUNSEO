package com.jumunseo.community.domain.comment.repository;

import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.comment.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    Long countByBoard(Board board);

    void deleteAllByHeadCommentId(Long headCommentId);

    List<Comment> findAllByBoardOrderByHeadCommentId(Board board);
}
