package com.jumunseo.debate.domain.opinion.controller;

import com.jumunseo.debate.domain.opinion.service.OpinionService;
import com.jumunseo.debate.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/debate/opinion")
public class OpinionQueryController {

    private final OpinionService opinionService;
    // 해당 주제의 이전 채팅 조회 (페이징 with last chat id)
    // -1 을 주면 해당시점부터 최신 10개
    @GetMapping("/{subjectId}/{last}")
    public ResponseEntity<Result<?>> getSubjectChat(@PathVariable Long subjectId, @PathVariable Long last) {
        return ResponseEntity.ok().body(Result.successResult(opinionService.getOpinionByLast(subjectId, last)));
    }

    // 해당 주제에 찬성 혹은 반대 투표 기록(이 사용자가 이전에 어떤 선택을 했는지 리턴)
    @GetMapping("/side/{subjectId}/{userEmail}")
    public ResponseEntity<Result<?>> getSide(@PathVariable Long subjectId, @PathVariable String userEmail) {
        return ResponseEntity.ok().body(Result.successResult(opinionService.getSide(subjectId, userEmail)));
    }
}
