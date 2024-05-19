package com.jumunseo.compositeservice.global.exception;

import org.springframework.http.HttpStatus;

public class LocalIOException extends CustomException{
    public LocalIOException(String message) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
