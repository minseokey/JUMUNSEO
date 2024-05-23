package com.jumunseo.community.global.exception;

import org.springframework.http.HttpStatus;

public class RedisReceivingException extends CustomException{
    public RedisReceivingException(String message) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
