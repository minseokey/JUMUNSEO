package com.jumunseo.community.domain.comment.exceptions;

import com.jumunseo.community.global.exception.CustomException;
import org.springframework.http.HttpStatus;

public class NoCommentException extends CustomException{
    public NoCommentException(String message) {
        super(HttpStatus.BAD_REQUEST, message);
    }
}
