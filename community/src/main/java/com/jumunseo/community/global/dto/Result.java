package com.jumunseo.community.global.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Result<T> {
    private Code code;
    private String message;
    private T data;

    @Builder
    public Result(Code code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> Result<T> successResult(T data) {
        return Result.<T>builder()
                .code(Code.SUCCESS)
                .message("")
                .data(data)
                .build();
    }

    public static <T> Result<T> failResult(String message) {
        return Result.<T>builder()
                .code(Code.FAIL)
                .message(message)
                .data(null)
                .build();
    }
}
