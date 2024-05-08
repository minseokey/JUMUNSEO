package com.jumunseo.authservice.domain.jwt.controller;

import com.jumunseo.authservice.domain.jwt.dto.JwtTokenDto;
import com.jumunseo.authservice.domain.jwt.service.AccessTokenService;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import com.jumunseo.authservice.global.dto.Result;
import com.jumunseo.authservice.global.util.CookieProvider;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@Tag(name = "JWT", description = "JWT 토큰 관련 API")
public class JwtController {

    private final CookieProvider cookieProvider;
    private final RefreshTokenService refreshTokenService;
    private final AccessTokenService accessTokenService;
    @GetMapping("/reissue")
    @Tag(name = "JWT")
    @Operation(summary = "JWT 토큰 재발급", description = "Refresh Token을 이용하여 Access Token을 재발급합니다.")
    public ResponseEntity<Result<?>> refreshReissue(@RequestHeader("Authorization") String accessToken,
                                                    @CookieValue("refreshToken") String refreshToken) {
        // Access 재발급
        JwtTokenDto jwtTokenDto = refreshTokenService.refreshAccessJwtToken(accessToken,refreshToken);
        // 쿠키 재발급
        ResponseCookie responseCookie = cookieProvider.createRefreshTokenCookie(refreshToken);

        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, responseCookie.toString())
                .body(Result.successResult(jwtTokenDto));
    }

    @GetMapping("/check-access-token")
    @Operation(hidden = true)
    public ResponseEntity<Result<?>> checkAccessToken(@RequestHeader("Authorization") String accessToken) {
        accessTokenService.CheckAccessToken(accessToken);
        return ResponseEntity.ok(Result.successResult(null));
    }

    @GetMapping("/logout")
    @Tag(name = "JWT")
    @Operation(summary = "로그아웃", description = "Redis Token을 레디스, 쿠키에서 삭제합니다.")
    public ResponseEntity<Result<?>> logout(@RequestHeader("Authorization") String accessToken) {
        // 레디스 삭제
        refreshTokenService.logout(accessToken);
        // 쿠키도 삭제
        ResponseCookie responseCookie = cookieProvider.deleteRefreshTokenCookie();

        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, responseCookie.toString())
                .body(Result.successResult(null));
    }
}
