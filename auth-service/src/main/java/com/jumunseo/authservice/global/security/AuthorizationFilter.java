package com.jumunseo.authservice.global.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class AuthorizationFilter  extends OncePerRequestFilter {

    // 로그인 받은 URI 설정
    private static final String LOGIN_URI = "/login";


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        // 만약 로그인이면 인가는 필요 없다.
        if(request.getServletPath().equals(LOGIN_URI)){
            filterChain.doFilter(request, response);
            return;
        }
        filterChain.doFilter(request, response);

    }
}
