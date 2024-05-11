package com.jumunseo.authservice.global.exception;

import org.springframework.http.HttpStatus;

public class SimpleIOException extends CustomException{
    public SimpleIOException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
