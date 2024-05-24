package com.jumunseo.community.global.exception;

import org.springframework.http.HttpStatus;

public class CommandDiffException extends CustomException{
    public CommandDiffException(String message) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
