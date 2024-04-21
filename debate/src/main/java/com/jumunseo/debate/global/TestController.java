package com.jumunseo.debate.global;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import com.jumunseo.debate.domain.opinion.service.OpinionServiceImpl;
import com.jumunseo.debate.global.dto.Result;
import com.jumunseo.debate.global.open_ai.OpenAIService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class TestController {

    private final OpinionServiceImpl opinionService;
    private final OpenAIService aiService;

    @MessageMapping("/test/{channel}")
    // 웹소켓으로 메시지 받는거
    public String handleMessage(@DestinationVariable String channel, String message) {
        System.out.println("컨트롤러 진입");
        OpinionDto opinionDto = OpinionDto.builder()
                .content(message)
                .type(MessageType.TALK)
                .side(MessageSide.LEFT)
                .subjectId(1L)
                .userId(1L)
                .userName(channel)
                .build();
        opinionService.test(opinionDto);

        return message;
    }

    @PostMapping("/test")
    public ResponseEntity<Result<?>> test(@RequestBody Map<String,String> prompt) {
        List<String> msg = new ArrayList<>();
        msg.add(prompt.get("message"));
        msg.add("지금까지 나오지 않은 내용들로 부탁해");
        String res = aiService.sendRequest(msg, "너는 오늘 토론의 주제를 만들어주는 인공지능이야");
        return ResponseEntity.ok(Result.successResult(res));
    }
}
