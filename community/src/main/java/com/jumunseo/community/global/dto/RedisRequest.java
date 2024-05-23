package com.jumunseo.community.global.dto;

import lombok.Data;

@Data
public class RedisRequest {
    String data; // internal dto 가 파싱되어 들어갈 자리
    String email;
    String role;
    String command;
}
