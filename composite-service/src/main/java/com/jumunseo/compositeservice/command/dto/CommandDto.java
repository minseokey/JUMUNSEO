package com.jumunseo.compositeservice.command.dto;

import lombok.Data;

import java.util.Map;

@Data
public class CommandDto {
    String data; // internal dto 가 파싱되어 들어갈 자리
    String email;
    String role;
    String command; // 이게 어떤 명령인지 알려줄것, 어차피 그룹아이디로 나누기는 할거다.
}
