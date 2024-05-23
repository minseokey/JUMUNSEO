package com.jumunseo.debate.global.exception;

import org.springframework.http.HttpStatus;

public class NoResponseException extends CustomException{
    public NoResponseException(String message) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
