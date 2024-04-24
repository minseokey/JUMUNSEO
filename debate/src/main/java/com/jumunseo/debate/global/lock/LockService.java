package com.jumunseo.debate.global.lock;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
@RequiredArgsConstructor
public class LockService {

    private final RedisTemplate<String, Object> redisTemplate;

    public boolean acquireLock(String lock_key) {
        Boolean access = redisTemplate.opsForValue().setIfAbsent(lock_key, "locked");
        if (access != null && access) {
            // 10시간 동안 유효
            redisTemplate.expire(lock_key, 10, TimeUnit.HOURS);
            return true;
        }
        return false;
    }

    public void releaseLock(String lock_key) {
        redisTemplate.delete(lock_key);
    }

}
