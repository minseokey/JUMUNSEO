package com.jumunseo.community.global.redis;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class RedisSubService implements MessageListener {
    private final RedisTemplate<String,Object> redisTemplate;
    private final ObjectMapper objectMapper;

    // Redis에서 메시지(sub)를 받았을 때 실행되는 메소드
    @Override
    public void onMessage(Message message, byte[] pattern) {
    }
}
