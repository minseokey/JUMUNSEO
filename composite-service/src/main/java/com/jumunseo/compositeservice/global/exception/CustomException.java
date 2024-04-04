package com.jumunseo.compositeservice.global.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class CustomException extends RuntimeException{
    private final HttpStatus httpStatus;
    private final Result<?> result;

    public CustomException(HttpStatus httpStatus, String message) {
        this.httpStatus = httpStatus;
        this.result = Result.failResult(message);
    }
}
