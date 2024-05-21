package com.jumunseo.community.domain.comment.exceptions;

import com.jumunseo.community.global.exception.CustomException;
import org.springframework.http.HttpStatus;

public class NoBoardException extends CustomException {
    public NoBoardException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
