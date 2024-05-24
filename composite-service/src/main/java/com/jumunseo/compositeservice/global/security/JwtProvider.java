package com.jumunseo.compositeservice.global.security;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@RequiredArgsConstructor
public class JwtProvider {

    // OS 환경변수
    @Value("${jwt.secret}")
    private String secretKey;

    // 테스트용 accessToken 만들기.
    public String createTestAccessToken() {
        Claims claims = Jwts.claims().setSubject("test");
        claims.put("role", "USER");

        Date now = new Date();
        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(new Date(now.getTime() + 3600000))
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }


    // 토큰의 서브젝트인 이메일 추출
    public String getEmailForAccessToken(String token) {
        return getClaimes(token).getSubject();
    }

    // 토큰의 클레임 추출
    public Claims getClaimes(String token) {
        try {
            return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
        }
        catch (ExpiredJwtException e) {
            return e.getClaims();
        }
    }

    public String getRole(String token) {
        return getClaimes(token).get("role").toString();
    }


    public boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
            return true;
        }
        catch (SignatureException e) {
            throw new IllegalArgumentException("Invalid JWT signature");
        }
        catch (MalformedJwtException e) {
            throw new IllegalArgumentException("Invalid JWT token");
        }
        catch (ExpiredJwtException e) {
            throw new IllegalArgumentException("Expired JWT token");
        }
        catch (UnsupportedJwtException e) {
            throw new IllegalArgumentException("Unsupported JWT token");
        }
        catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("JWT claims string is empty.");
        }
    }
}