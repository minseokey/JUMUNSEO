package com.jumunseo.authservice.global.util;

import org.springframework.beans.factory.annotation.Value;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.UUID;

@Component
public class JwtTokenProvider {

    @Value("${jwt.secret}")
    private String secretKey;

    @Value("${jwt.access_expiration}")
    private long accessTokenExpiration;

    @Value("${jwt.refresh_expiration}")
    private long refreshTokenExpiration;

    private final String JwtPrefix = "Bearer ";

    public String createAccessToken(String userId, String role) {
        Claims claims = Jwts.claims().setSubject(userId);
        claims.put("role", role);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + accessTokenExpiration))
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }

    public String createRefreshToken() {
        Claims claims = Jwts.claims();
        claims.put("value", UUID.randomUUID().toString());

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + refreshTokenExpiration))
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }

    // 토큰의 서브젝트인 이메일 추출
    public String getEmail(String token) {
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

    public String getRefreshTokenId(String token) {
        return getClaimes(token).get("value").toString();
    }

    public Date getExpirationTime(String token) {
        return getClaimes(token).getExpiration();
    }

    public String getRole(String token) {
        return getClaimes(token).get("role").toString();
    }

    public Boolean sameRefreshToken(String token, String tokenId) {
        return getRefreshTokenId(token).equals(tokenId);
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