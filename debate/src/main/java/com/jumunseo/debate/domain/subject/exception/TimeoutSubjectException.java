package com.jumunseo.debate.domain.subject.exception;

import com.jumunseo.debate.global.exception.CustomException;
import org.springframework.http.HttpStatus;

public class TimeoutSubjectException extends CustomException {
    public TimeoutSubjectException(String message) {
        super(HttpStatus.REQUEST_TIMEOUT, message);
    }
}
