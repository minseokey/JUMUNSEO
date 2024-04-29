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
    public CommandDto setMessage(HttpServletRequest request, CommandDto data, String body, String command){
        data.setEmail(request.getAttribute("email").toString());
        data.setRole(request.getAttribute("role").toString());
        data.setName(request.getAttribute("name").toString());
        data.setCommand(command);
        data.setData(body);
        return data;
    }
}
