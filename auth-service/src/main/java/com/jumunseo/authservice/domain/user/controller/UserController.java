package com.jumunseo.authservice.domain.user.controller;

import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    // 토큰으로 유저 정보 가져오기
    @GetMapping("/info")
    public ResponseEntity<Result<?>> getUserInfoByToken() {
        return null;
    }

    // 유저 아이디로 유저 정보 가져오기
    @GetMapping("/info/{userId}")
    public ResponseEntity<Result<?>> getUserInfoByUserId(@PathVariable Long userId) {
        return null;
    }

    // 이메일로 유저 정보 가져오기
    @GetMapping("/info/email/{email}")
    public ResponseEntity<Result<?>> getUserInfoByEmail(@PathVariable String userEmail) {
        return null;
    }

    // 바디에 유저 아이디 리스트를 넣어서 유저 정보를 가져올 수 있게
    @GetMapping("/info/users")
    public ResponseEntity<Result<?>> getUserInfoByUserIds(@RequestBody List<Long> userIds) {
        return null;
    }

    // 토큰으로 유저 정보 수정
    @PutMapping("/")
    public ResponseEntity<Result<?>> updateUserInfo() {
        return null;
    }

    // 토큰으로 유저 정보 삭제
    @DeleteMapping("/")
    public ResponseEntity<Result<?>> deleteUserInfo() {
        return null;
    }

    // 회원가입
    @PostMapping("/signup")
    public ResponseEntity<Result<?>> signUp(@RequestBody SignupDto signupDto) {
        return null;
    }
}
