package com.jumunseo.compositeservice.global.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@RequiredArgsConstructor
public class AuthorizationFilter extends OncePerRequestFilter{
    private final JwtProvider jwtProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain filterChain) throws ServletException, IOException {

        String header = req.getHeader("Authorization");
        // 토큰 존재 검사
        if(header == null || !header.startsWith("Bearer")) {
            filterChain.doFilter(req, res);
            return;
        }
        String accesstoken = header.replace("Bearer ", "");
        // 토큰 유효성 검사
        if(!jwtProvider.validateToken(accesstoken)) {
            throw new RuntimeException("유효하지 않은 토큰입니다.");
        }
        // 토큰 만료 검사
        if(jwtProvider.getExpirationTime(accesstoken).getTime() - System.currentTimeMillis() < 0) {
            throw new RuntimeException("토큰이 만료되었습니다.");
        }
        res.setHeader("email", jwtProvider.getEmailForAccessToken(accesstoken));
        res.setHeader("role", jwtProvider.getRole(accesstoken));
        res.setHeader("name", jwtProvider.getName(accesstoken));

        filterChain.doFilter(req, res);
    }
}
