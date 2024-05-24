package com.jumunseo.community.global.exception;

import org.springframework.http.HttpStatus;

import com.jumunseo.community.global.dto.Result;

import lombok.Getter;

@Getter
public class CustomException extends RuntimeException {

    private final HttpStatus httpStatus;
    private final Result<?> result;

    public CustomException(HttpStatus httpStatus, String message) {
        this.httpStatus = httpStatus;
        this.result = Result.failResult(message);
    }
}
