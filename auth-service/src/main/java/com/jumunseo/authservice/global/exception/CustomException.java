package com.jumunseo.authservice.global.exception;

import com.jumunseo.authservice.global.dto.Result;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class CustomException extends RuntimeException{
    private HttpStatus httpStatus;
    private Result<?> result;

    public CustomException(HttpStatus httpStatus, String message) {
        this.httpStatus = httpStatus;
        this.result = Result.failResult(message);
    }
}
