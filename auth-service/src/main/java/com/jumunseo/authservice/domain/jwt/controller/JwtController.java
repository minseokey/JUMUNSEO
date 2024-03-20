package com.jumunseo.authservice.domain.jwt.controller;

import com.jumunseo.authservice.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class JwtController {
    @GetMapping("/refresh-reissue")
    public ResponseEntity<Result<?>> refreshReissue() {
        return null;
    }

    @GetMapping("/check-access-token")
    public ResponseEntity<Result<?>> checkAccessToken() {
        return null;
    }
}
