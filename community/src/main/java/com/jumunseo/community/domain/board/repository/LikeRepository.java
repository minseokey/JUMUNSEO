package com.jumunseo.community.domain.board.repository;

import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.board.entity.LikeBoard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LikeRepository extends JpaRepository<LikeBoard, Long> {
    Long countByBoardId(Long boardId);
    Optional<LikeBoard> findByBoardAndUserId(Board board, String userId);
}
