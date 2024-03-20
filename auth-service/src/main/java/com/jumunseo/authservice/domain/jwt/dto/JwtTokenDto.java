package com.jumunseo.authservice.domain.jwt.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class JwtTokenDto {
    private String accessToken;
    private String refreshToken;
    private Date accessTokenExpiredDate;
}
