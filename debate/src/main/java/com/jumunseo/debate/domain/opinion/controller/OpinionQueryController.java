package com.jumunseo.debate.domain.opinion.controller;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.service.OpinionService;
import com.jumunseo.debate.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/opinion")
public class OpinionQueryController {

    private final OpinionService opinionService;
    // 해당 주제의 이전 채팅 조회 (페이징 with Slice)
    @GetMapping("/{subjectId}/{last}")
    public ResponseEntity<Result<?>> getSubjectChat(@PathVariable Long subjectId, @PathVariable Long last) {
        return ResponseEntity.ok().body(Result.successResult(opinionService.getOpinionByLast(subjectId, last)));
    }

    // 해당 주제에 찬성 혹은 반대 투표 기록
    @GetMapping("/side/{subjectId}/{userId}")
    public ResponseEntity<Result<?>> getSide(@PathVariable Long subjectId, @PathVariable Long userId) {
        return ResponseEntity.ok().body(Result.successResult(opinionService.getSide(subjectId, userId)));
    }

    // 웹소켓으로 메시지 받는거
    @MessageMapping("/chat/{channel}")
    public void handleMessage(@DestinationVariable String channel ,@RequestBody OpinionDto opinionDto) {
        opinionService.sendMessage(channel,opinionDto);
    }
}
