package com.jumunseo.community.domain.board.controller;

import com.jumunseo.community.domain.board.dto.BoardRequestDto;
import com.jumunseo.community.domain.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
@RequiredArgsConstructor
public class BoardCommandController {

    private final BoardService boardService;
    // 생성
    public void createBoard(BoardRequestDto boardRequestDto){
        boardService.registerBoard(boardRequestDto);
    }

    // 삭제
    public void deleteBoard(Long boardId, String email){
        boardService.removeBoard(boardId, email);
    }

    // 수정
    public void updateBoard(Map<String,Object> update, String email){
        boardService.modifyBoard(update, email);
    }

    // 좋아요(토글)
    public void toggleLike(Long BoardId, String email){
        boardService.Like(BoardId, email);
    }
}
