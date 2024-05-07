package com.jumunseo.compositeservice.global.exception;

import org.springframework.http.HttpStatus;

public class JsonParsingException extends CustomException {
    public JsonParsingException(String message){
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
