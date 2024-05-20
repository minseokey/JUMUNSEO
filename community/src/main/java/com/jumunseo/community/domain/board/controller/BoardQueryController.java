package com.jumunseo.community.domain.board.controller;

import com.jumunseo.community.domain.board.service.BoardService;
import com.jumunseo.community.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/board")
@RequiredArgsConstructor
public class BoardQueryController {
    private final BoardService boardService;
    // 게시글 리스트 조회
    @GetMapping("/list/{index}")
    public ResponseEntity<Result<?>> getBoardList(@PathVariable Long index) {
        return ResponseEntity.ok().body(Result.successResult(boardService.getBoardListByLatest(index)));
    }

    // 게시글 리스트 조회 with 카테고리
    @GetMapping("/list/{category}/{index}")
    public ResponseEntity<Result<?>> getBoardListByCategory(@PathVariable Long index, @PathVariable String category) {
        return ResponseEntity.ok().body(Result.successResult(boardService
                .getBoardListByLatestAndCategory(index, category)));
    }

    // 게시글 상세 조회
    @GetMapping("/detail/{id}")
    public ResponseEntity<Result<?>> getBoardDetail(@RequestHeader("email") String userId, @PathVariable Long id) {
        return ResponseEntity.ok().body(Result.successResult(boardService.getBoard(id, userId)));
    }
}
