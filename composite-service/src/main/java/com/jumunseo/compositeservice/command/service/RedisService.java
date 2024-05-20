package com.jumunseo.compositeservice.command.service;

import com.jumunseo.compositeservice.command.dto.CommandDto;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class RedisService implements MessageQueueAbstractService{

    private final RedisTemplate<String,Object> redisTemplate;
    public void send(String topic, CommandDto data){
        redisTemplate.convertAndSend(topic, data);
    }

    // 형식은 헤더에 email, role
    // command - body로 구성
    // command 를 읽고 명령어 구분.
    public CommandDto setMessage(HttpServletRequest request, CommandDto data, String body, String command){
        data.setEmail(request.getAttribute("email").toString());
        data.setRole(request.getAttribute("role").toString());
        data.setCommand(command);
        data.setData(body);
        return data;
    }
    public CommandDto setMessage(CommandDto data, String body, String command){
        data.setEmail("ADMIN");
        data.setRole("ADMIN");
        data.setCommand(command);
        data.setData(body);
        return data;
    }

}
