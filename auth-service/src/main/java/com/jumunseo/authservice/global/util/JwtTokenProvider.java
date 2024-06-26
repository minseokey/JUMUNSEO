package com.jumunseo.authservice.global.util;

import com.jumunseo.authservice.domain.user.entity.Role;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import io.jsonwebtoken.*;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.UUID;

@Component
@RequiredArgsConstructor
@Slf4j
public class JwtTokenProvider {

    // OS 환경변수
    @Value("${jwt.secret}")
    private String secretKey;

    // OS 환경변수
    @Value("${jwt.access_expiration}")
    private long accessTokenExpiration;

    private final String JwtPrefix = "Bearer ";
    public String fromHeader(String header) {
        return header.replace(JwtPrefix, "");
    }
    public String createAccessToken(String userId, String role) {
        Claims claims = Jwts.claims().setSubject(userId);
        claims.put("role", role);

        Date now = new Date();
        return JwtPrefix + Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(now)
                .setExpiration(new Date(now.getTime() + accessTokenExpiration))
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }

    public String createRefreshToken() {
        Claims claims = Jwts.claims();
        claims.put("value", UUID.randomUUID().toString());

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .signWith(SignatureAlgorithm.HS256, secretKey)
                .compact();
    }

    // 토큰의 서브젝트인 이메일 추출
    public String getEmailForAccessToken(String a_token) {
        String token = fromHeader(a_token);
        return getClaimes(token).getSubject();
    }

    // 토큰의 클레임 추출
    public Claims getClaimes(String token) {
        if (token.startsWith(JwtPrefix)){
            token = fromHeader(token);
        }
        try {
            return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody();
        }
        catch (ExpiredJwtException e) {
            return e.getClaims();
        }
    }

    public String getRefreshTokenId(String r_token) {
        return getClaimes(r_token).get("value").toString();
    }

    public Date getExpirationTime(String token) {
        if(token.startsWith(JwtPrefix)){
            token = fromHeader(token);
        }
        return getClaimes(token).getExpiration();
    }

    public String getRole(String a_token) {
        String token = fromHeader(a_token);
        return getClaimes(token).get("role").toString();
    }

    // Token의 UUID 와 RefreshTokenId 비교
    public Boolean sameRefreshToken(String r_token, String tokenId) {
        return getRefreshTokenId(r_token).equals(tokenId);
    }

    public boolean validateToken(String token) {
        if (token.startsWith(JwtPrefix)){
            token = fromHeader(token);
        }
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