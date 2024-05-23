package com.jumunseo.debate.global.exception;

import com.jumunseo.debate.global.dto.Result;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(CustomException.class)
    public ResponseEntity<Result<?>> handler(CustomException e) {
        HttpStatus httpStatus = e.getHttpStatus();
        Result<?> result = e.getResult();
        return ResponseEntity.status(httpStatus).body(result);
    }
}
