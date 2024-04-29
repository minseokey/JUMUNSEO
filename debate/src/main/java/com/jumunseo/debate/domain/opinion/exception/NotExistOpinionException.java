package com.jumunseo.debate.domain.opinion.exception;

import com.jumunseo.debate.global.exception.CustomException;
import org.springframework.http.HttpStatus;

public class NotExistOpinionException extends CustomException {
    public NotExistOpinionException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
