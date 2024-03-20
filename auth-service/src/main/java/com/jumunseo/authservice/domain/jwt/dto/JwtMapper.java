package com.jumunseo.authservice.domain.jwt.dto;

import org.springframework.stereotype.Component;

@Component
public class JwtMapper {
    public static JwtTokenDto toDto(String accessToken, String refreshToken) {
        JwtTokenDto jwtTokenDto = new JwtTokenDto();
        jwtTokenDto.setAccessToken(accessToken);
        jwtTokenDto.setRefreshToken(refreshToken);
        return jwtTokenDto;
    }

}
