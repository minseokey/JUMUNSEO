package com.jumunseo.community.domain.board.service;

import com.jumunseo.community.domain.board.dto.BoardListResponseDto;
import com.jumunseo.community.domain.board.dto.BoardRequestDto;
import com.jumunseo.community.domain.board.dto.BoardResponseDto;
import com.jumunseo.community.domain.board.entity.CATEGORY;
import com.jumunseo.community.domain.post.entity.CategoryType;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface BoardService {

    // 1. 게시글 등록
    void registerBoard(BoardRequestDto board);
    // 2. 게시글 수정

    void modifyBoard(BoardRequestDto boardDTO, Long boardId);

    // 3. 게시글 삭제
    void removeBoard(Long boardId);

    // 4. 게시글 조회
    BoardResponseDto getBoard(Long boardId, String userId);

    List<BoardListResponseDto> getBoardListByLatestAndCategory (Long index, CATEGORY category);

    List<BoardListResponseDto> getBoardListByLatest(Long index);

    // 6. 게시글 좋아요 (토글)

    void Like(Long boardId, String userId);
}
