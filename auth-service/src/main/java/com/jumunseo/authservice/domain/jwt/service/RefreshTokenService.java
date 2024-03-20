package com.jumunseo.authservice.domain.jwt.service;

import com.jumunseo.authservice.domain.jwt.dto.JwtTokenDto;

public interface RefreshTokenService {
    void updateRefreshToken(Long id, String uuid);
    JwtTokenDto refreshJwtToken(String accessToken, String refreshToken);
}
