package com.jumunseo.debate.domain.subject.exception;

import com.jumunseo.debate.global.exception.CustomException;
import org.springframework.http.HttpStatus;

public class NotExistSubjectException extends CustomException {
    public NotExistSubjectException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
