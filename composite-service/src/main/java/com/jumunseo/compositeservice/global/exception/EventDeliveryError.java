package com.jumunseo.compositeservice.global.exception;

import org.springframework.http.HttpStatus;

public class EventDeliveryError extends CustomException{
    public EventDeliveryError(String message) {
        super(HttpStatus.INTERNAL_SERVER_ERROR, message);
    }
}
