package com.jumunseo.compositeservice.global.security;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

@RequiredArgsConstructor
public class AuthorizationFilter extends OncePerRequestFilter{
    private final JwtProvider jwtProvider;

    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain filterChain) throws ServletException, IOException {

        String header = req.getHeader("Authorization");
        // 토큰 존재 검사
        // 만약 토큰이 없거나 이상하면 -> UnSigned 권한을 주고 처리하자.
        if(header == null || !header.startsWith("Bearer")) {
            Collection<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add((GrantedAuthority) () -> "UNSIGNED"); // 권한이 없는 사용자
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                    "UNSIGNED",
                    null,
                    authorities
            ); // 결론적으로 email은 UNSIGNED, role은 UNSIGNED 인 가짜 Authentication 객체 생성
            SecurityContextHolder.getContext().setAuthentication(authentication);
            filterChain.doFilter(req, res);
            return;
        }
        String accesstoken = header.replace("Bearer ", "");

        // 토큰 유효성 검사, 토큰이 유효하지 않으면 예외 발생
        try{jwtProvider.validateToken(accesstoken);
            req.setAttribute("email", jwtProvider.getEmailForAccessToken(accesstoken));
            req.setAttribute("role", jwtProvider.getRole(accesstoken));

            // @Secured 사용을 위한 Authentication 객체 생성
            Collection<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add((GrantedAuthority) () -> jwtProvider.getRole(accesstoken));
            Authentication authentication = new UsernamePasswordAuthenticationToken(
                    jwtProvider.getEmailForAccessToken(accesstoken),
                    null,
                    authorities
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);
            filterChain.doFilter(req, res);
        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/jwt-error").forward(req, res);
        }
    }
}
