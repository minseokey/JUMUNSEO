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

    public Date getExpirationTime(String token) {
        return getClaimes(token).getExpiration();
    }

    public String getRole(String token) {
        return getClaimes(token).get("role").toString();
    }

    public String getName(String token) {
        return getClaimes(token).get("name").toString();
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