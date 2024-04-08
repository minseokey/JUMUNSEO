package com.jumunseo.compositeservice.command.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.compositeservice.command.dto.CommandDto;
import com.jumunseo.compositeservice.command.service.KafkaService;
import com.jumunseo.compositeservice.global.exception.Result;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RequiredArgsConstructor
@RequestMapping ("/command")
@Controller
public class CommandController {

    private final KafkaService kafkaService;

    // User는 카프카 사용 x, 토큰만 필요하거나, 토큰조차 필요 없는 경우가 많아 비효율적일것으로 예상.
    // Magician
    // Community
    // Debate

    @PostMapping("/test")
    @Secured("USER")
    public ResponseEntity<Result<?>> test(HttpServletRequest request, @RequestBody Map<String,Object> body) throws JsonProcessingException {
        // 요청 자체의 정보 (데이터 + 토큰정보)
        CommandDto data = new CommandDto();

        // 데이터를 Map으로 받아서 String으로 변환 for Kafka
        ObjectMapper objectMapper = new ObjectMapper();
        String requestStr = objectMapper.writeValueAsString(body);

        // 각각의 메시지를 나눠서 다른 토픽으로 보내기
        CommandDto sending_data = kafkaService.setMessage(request, data, requestStr, "do test");
        kafkaService.send("test", sending_data);
        return ResponseEntity.ok(Result.successResult(null));
    }
}
