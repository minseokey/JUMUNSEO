package com.jumunseo.debate.domain.opinion.controller;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.service.OpinionService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Controller
@RequiredArgsConstructor
public class OpinionCommandController {

    private final OpinionService opinionService;

    // Composite 서버의 프록시를 거쳐서 도착.
    // 웹소켓으로 메시지 받는거
    @MessageMapping("/chat/{channel}")
    public void handleMessage(@DestinationVariable String channel , @RequestBody OpinionDto opinionDto) {
        LocalDateTime time = LocalDateTime.now();
        opinionDto.setTime(time);
        opinionService.sendMessage(channel,opinionDto);
    }
}
