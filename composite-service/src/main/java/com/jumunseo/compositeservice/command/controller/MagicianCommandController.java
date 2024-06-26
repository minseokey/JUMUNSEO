package com.jumunseo.compositeservice.command.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.compositeservice.command.dto.CommandDto;
import com.jumunseo.compositeservice.command.service.RedisService;
import com.jumunseo.compositeservice.global.exception.EventDeliveryError;
import com.jumunseo.compositeservice.global.exception.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@RequiredArgsConstructor
@RequestMapping ("/command/magician")
@Tag(name = "Magician Command", description = "마법사 서비스를 위한 커맨드 컨트롤러")
@Controller
public class MagicianCommandController {

    private final RedisService redisService;

    // 채팅방 삭제
    // 로그인 필요 O
    @DeleteMapping("/{room_id}")
    @Secured("USER")
    @Tag(name = "Magician Command")
    @Operation(summary = "Delete Chat", description = "채팅방을 삭제하는 메소드")
    public ResponseEntity<Result<?>> deleteChat(HttpServletRequest request, @PathVariable String room_id) {
        try {
            // 요청 자체의 정보 (데이터 + 토큰정보)
            CommandDto data = new CommandDto();

            // 데이터를 Map으로 받아서 String으로 변환 for Kafka
            ObjectMapper objectMapper = new ObjectMapper();
            String requestStr = objectMapper.writeValueAsString(Map.of("room_id", room_id));

            // 각각의 메시지를 나눠서 다른 토픽으로 보내기
            CommandDto sending_data = redisService.setMessage(request, data, requestStr, "DeleteChat");
            redisService.send("magician", sending_data);
            return ResponseEntity.ok(Result.successResult(null));
        } catch (Exception e) {
            throw new EventDeliveryError("이벤트를 Redis로 전달하는 과정에서 에러가 발생했습니다.");
        }
    }
}
