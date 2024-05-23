package com.jumunseo.community.domain.board.repository;

import com.jumunseo.community.domain.board.entity.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {

    // 카테고리별로 10개씩 불러오기
    @Query("SELECT b FROM Board b WHERE b.category = :category AND b.id < :index order by b.id DESC LIMIT 10")
    List<Board> findAllByCategoryAndIndex(Long index, String category);

    // 10개씩 불러오기
    @Query("SELECT b FROM Board b WHERE b.id < :index order by b.id DESC LIMIT 10")
    List<Board> findAllByIndex(Long index);


    // 최신 10개
    @Query("SELECT b FROM Board b order by b.id DESC LIMIT 10")
    List<Board> findAllByLatest();

    // 최신 10개 카테고리 맞게
    @Query("SELECT b FROM Board b WHERE b.category = :category order by b.id DESC LIMIT 10")
    List<Board> findAllByLatestAndCategory(String category);
}
