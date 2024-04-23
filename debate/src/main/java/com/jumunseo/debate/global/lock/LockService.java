package com.jumunseo.debate.global.lock;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
@RequiredArgsConstructor
public class LockService {
    private static final String LOCK_KEY = "SubjectLock";
    private final RedisTemplate<String, Object> redisTemplate;

    private boolean acquireLock() {
        Boolean access = redisTemplate.opsForValue().setIfAbsent(LOCK_KEY, "locked");
        if (access != null && access) {
            // 10시간 동안 유효
            redisTemplate.expire(LOCK_KEY, 10, TimeUnit.HOURS);
            return true;
        }
        return false;
    }

    private void releaseLock() {
        redisTemplate.delete(LOCK_KEY);
    }

}
