package com.jumunseo.community.global.exception;

import org.springframework.http.HttpStatus;

public class S3IOException extends CustomException {
    public S3IOException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
