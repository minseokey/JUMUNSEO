package com.jumunseo.authservice.domain.user.controller;

import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.global.dto.Result;
import com.jumunseo.authservice.domain.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // 토큰으로 유저 정보 가져오기
    @GetMapping("/info")
    public ResponseEntity<Result<?>> getUserInfoByToken(@RequestHeader("Authorization") String authorizationHeader){
        return ResponseEntity.ok(Result.successResult(userService.findUserByToken(authorizationHeader)));
    }

    // 유저 아이디로 유저 정보 가져오기
    @GetMapping("/info/{userId}")
    public ResponseEntity<Result<?>> getUserInfoByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(Result.successResult(userService.findUserById(userId)));
    }

    // 이메일로 유저 정보 가져오기
    @GetMapping("/info/email/{email}")
    public ResponseEntity<Result<?>> getUserInfoByEmail(@PathVariable String email) {
        return ResponseEntity.ok(Result.successResult(userService.findUserByEmail(email)));
    }

    // 바디에 유저 아이디 리스트를 넣어서 유저 정보를 가져올 수 있게
    @GetMapping("/info/users/{userIds}")
    public ResponseEntity<Result<?>> getUserInfoByUserIds(@PathVariable List<Long> userIds) {
        return ResponseEntity.ok(Result.successResult(userService.findUsersByIds(userIds)));
    }

    // 토큰으로 유저 정보 수정
    @PutMapping("/update")
    public ResponseEntity<Result<?>> updateUserInfo(@RequestHeader("Authorization") String authorizationHeader,
                                                    @RequestBody Map<String,String> updateInfo) {
        UserDto newUser = userService.updateUser(authorizationHeader, updateInfo);
        return ResponseEntity.ok(Result.successResult(newUser));
    }

    // 토큰으로 유저 정보 삭제
    @DeleteMapping("/delete")
    public ResponseEntity<Result<?>> deleteUserInfo(@RequestHeader("Authorization") String authorizationHeader) {
        userService.deleteUser(authorizationHeader);
        return ResponseEntity.ok(Result.successResult(null));
    }

    // 회원가입
    @PostMapping("/signup")
    public ResponseEntity<Result<?>> signUp(@Valid @RequestBody SignupDto signupDto) {
        userService.saveUser(signupDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(Result.successResult(null));
    }
}
