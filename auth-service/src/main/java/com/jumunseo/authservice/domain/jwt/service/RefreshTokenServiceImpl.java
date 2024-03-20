package com.jumunseo.authservice.domain.jwt.service;

import com.jumunseo.authservice.domain.jwt.dto.JwtTokenDto;
import com.jumunseo.authservice.domain.user.entity.User;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RefreshTokenServiceImpl implements RefreshTokenService{

    private final UserRepository userRepository;

    @Override
    public void updateRefreshToken(Long id, String uuid) {
        // 1. 사용자가 존재하는지 확인
        User user = userRepository.findById(id).orElseThrow(
                () -> new NotExistUserException("존재하지 않는 사용자입니다."));

        // 2. refreshToken 업데이트


    }

    @Override
    public JwtTokenDto refreshJwtToken(String accessToken, String refreshToken) {
        // 1. refreshToken이 유효한지 확인
        // 2. accessToken 업데이트
    }
}
