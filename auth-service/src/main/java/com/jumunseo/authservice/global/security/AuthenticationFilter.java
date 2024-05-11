package com.jumunseo.authservice.global.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.global.dto.LoginRequest;
import com.jumunseo.authservice.global.dto.Result;
import com.jumunseo.authservice.global.exception.CredInfoNonCorrectException;
import com.jumunseo.authservice.global.exception.SimpleIOException;
import com.jumunseo.authservice.global.util.CookieProvider;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import jakarta.servlet.FilterChain;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseCookie;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

@RequiredArgsConstructor
public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter{

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider jwtTokenProvider;
    private final RefreshTokenService refreshTokenService;
    private final CookieProvider cookieProvider;

    // 인증 시도
    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) {
        Authentication authentication;
        try {
            // 로그인 요청 정보를 파싱
            LoginRequest loginRequest = new ObjectMapper().readValue(req.getInputStream(), LoginRequest.class);
            // 로그인 시도, 인증 매니저에서 사용하는 토큰 만들어서 제공한다.
            authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            loginRequest.getEmail(),
                            loginRequest.getPassword())
            );
            // 만약 쿠키에 refresh 토큰이 있다면 삭제
            Cookie cookie = cookieProvider.of(cookieProvider.createRefreshTokenCookie(""));
            res.addCookie(cookie);
        } catch (AuthenticationException e) {
            throw new CredInfoNonCorrectException("로그인 정보가 올바르지 않습니다.");
        }catch (IOException e) {
            throw new SimpleIOException("로그인 정보를 읽는데 실패했습니다.");
        }
        return authentication;
    }


    // 인증 성공, 토큰 제공
    @Override
    protected void successfulAuthentication(HttpServletRequest req, HttpServletResponse res, FilterChain chain, Authentication auth) throws IOException {

        String role = auth.getAuthorities().stream().findFirst().get().getAuthority();
        String userEmail = auth.getName();
        String accessToken = jwtTokenProvider.createAccessToken(userEmail, role);
        Date accessTokenExpiredDate = jwtTokenProvider.getExpirationTime(accessToken);
        String refreshToken = jwtTokenProvider.createRefreshToken();
        refreshTokenService.updateRefreshToken(userEmail, jwtTokenProvider.getRefreshTokenId(refreshToken));

        // 쿠키에 refresh 토큰 저장
        ResponseCookie responseRefreshCookie = cookieProvider.createRefreshTokenCookie(refreshToken);
        Cookie cookie = cookieProvider.of(responseRefreshCookie);

        res.setContentType("application/json");
        res.addCookie(cookie);

        // body 에 access 토큰 저장
        Map<String,Object> Token = Map.of(
                "accessToken", accessToken,
                "expiredTime", accessTokenExpiredDate);

        new ObjectMapper().writeValue(res.getOutputStream(), Result.successResult(Token));
    }
}
