package com.jumunseo.compositeservice.command.service;

import com.jumunseo.compositeservice.command.dto.CommandDto;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class RedisService implements MessageQueueAbstractService{
    public void send(String topic, CommandDto data){

    }
    public CommandDto setMessage(HttpServletRequest request, CommandDto data, String body, String command){
        return null;
    }
}
