package com.jumunseo.authservice.global.exception;

import org.springframework.http.HttpStatus;

public class CredInfoNonCorrectException extends CustomException {
    public CredInfoNonCorrectException(String message) {
        super(HttpStatus.UNAUTHORIZED, message);
    }
}
