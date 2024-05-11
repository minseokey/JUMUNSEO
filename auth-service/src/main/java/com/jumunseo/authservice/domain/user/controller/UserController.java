package com.jumunseo.authservice.domain.user.controller;

import com.jumunseo.authservice.domain.jwt.dto.JwtTokenDto;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UpdateDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.global.dto.Result;
import com.jumunseo.authservice.domain.user.service.UserService;
import com.jumunseo.authservice.global.util.CookieProvider;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
@Tag(name = "User", description = "유저 관련 API")
public class UserController {

    private final UserService userService;
    private final CookieProvider cookieProvider;

    // 토큰으로 유저 정보 가져오기
    @GetMapping("/info")
    @Tag(name = "User")
    @Operation(summary = "토큰으로 유저 정보 가져오기", description = "토큰을 이용하여 유저 정보를 가져옵니다.")
    public ResponseEntity<Result<?>> getUserInfoByToken(@RequestHeader("Authorization") String authorizationHeader){
        return ResponseEntity.ok(Result.successResult(userService.findUserByToken(authorizationHeader)));
    }

    // 유저 아이디로 유저 정보 가져오기
    @GetMapping("/info/{userId}")
    @Operation(hidden = true)
    public ResponseEntity<Result<?>> getUserInfoByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(Result.successResult(userService.findUserById(userId)));
    }

    // 이메일로 유저 정보 가져오기
    @GetMapping("/info/email/{email}")
    @Operation(hidden = true)
    public ResponseEntity<Result<?>> getUserInfoByEmail(@PathVariable String email) {
        return ResponseEntity.ok(Result.successResult(userService.findUserByEmail(email)));
    }

    // 바디에 유저 아이디 리스트를 넣어서 유저 정보를 가져올 수 있게
    @GetMapping("/info/users/{userIds}")
    @Operation(hidden = true)
    public ResponseEntity<Result<?>> getUserInfoByUserIds(@PathVariable List<Long> userIds) {
        return ResponseEntity.ok(Result.successResult(userService.findUsersByIds(userIds)));
    }

    // 토큰으로 유저 정보 수정
    @Tag(name = "User")
    @Operation(summary = "토큰으로 유저 정보 수정", description = "토큰을 이용하여 유저 정보를 수정합니다.")
    @PutMapping("/update")
    public ResponseEntity<Result<?>> updateUserInfo(@RequestHeader("Authorization") String authorizationHeader,
                                                    @CookieValue("refreshToken") String refreshToken,
                                                    @RequestBody Map<String,String> updateInfo) {

        UpdateDto updateDto = userService.updateUser(authorizationHeader, updateInfo);
        ResponseCookie responseCookie = cookieProvider.createRefreshTokenCookie(updateDto.getRefreshToken());

        return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, responseCookie.toString())
                .body(Result.successResult(updateDto));
    }

    // 토큰으로 유저 정보 삭제
    @Tag(name = "User")
    @Operation(summary = "토큰으로 유저 정보 삭제", description = "토큰을 이용하여 유저 정보를 삭제합니다.")
    @DeleteMapping("/delete")
    public ResponseEntity<Result<?>> deleteUserInfo(@RequestHeader("Authorization") String authorizationHeader) {
        userService.deleteUser(authorizationHeader);
        return ResponseEntity.ok(Result.successResult(null));
    }

    // 회원가입
    @Tag(name = "User")
    @Operation(summary = "회원가입", description = "회원가입을 합니다.")
    @PostMapping("/signup")
    public ResponseEntity<Result<?>> signUp(@Valid @RequestBody SignupDto signupDto) {
        userService.saveUser(signupDto);
        return ResponseEntity.status(HttpStatus.CREATED).body(Result.successResult(null));
    }

    // 이메일 중복 체크
    @GetMapping("/duplicate/{email}")
    @Tag(name = "User")
    @Operation(summary = "이메일 중복 체크", description = "이메일 중복을 체크합니다.")
    public ResponseEntity<Result<?>> checkDuplicateEmail(@PathVariable String email) {
        return ResponseEntity.ok(Result.successResult(userService.duplicateEmailCheck(email)));
    }

    // 차단목록 추가
    @PostMapping("/block/{blockUserEmail}")
    @Tag(name = "User")
    @Operation(summary = "차단목록 추가", description = "차단목록에 추가합니다.")
    public ResponseEntity<Result<?>> addBlockList(@RequestHeader("Authorization") String authorizationHeader,
                                                  @PathVariable String blockUserEmail) {
        userService.addBlockList(authorizationHeader, blockUserEmail);
        return ResponseEntity.ok(Result.successResult(userService.getBlockList(authorizationHeader)));
    }

    // 차단목록 삭제
    @DeleteMapping("/block/{blockUserEmail}")
    @Tag(name = "User")
    @Operation(summary = "차단목록 삭제", description = "차단목록에서 삭제합니다.")
    public ResponseEntity<Result<?>> deleteBlockList(@RequestHeader("Authorization") String authorizationHeader,
                                                     @PathVariable String blockUserEmail) {
        userService.deleteBlockList(authorizationHeader, blockUserEmail);
        return ResponseEntity.ok(Result.successResult(userService.getBlockList(authorizationHeader)));
    }

    // 차단목록 가져오기
    @GetMapping("/block")
    @Tag(name = "User")
    @Operation(summary = "차단목록 가져오기", description = "차단목록을 가져옵니다.")
    public ResponseEntity<Result<?>> getBlockList(@RequestHeader("Authorization") String authorizationHeader) {
        return ResponseEntity.ok(Result.successResult(userService.getBlockList(authorizationHeader)));
    }

    // 프로필 이미지 교체
    // 만약 새로운 이미지 없이 요청이 들어온거라면 기본이미지로 교체 -> 삭제.
    @PostMapping("/profile")
    @Tag(name = "User")
    @Operation(summary = "프로필 이미지 교체", description = "프로필 이미지를 교체합니다, 만약 이미지가 없다면 기본 이미지로 교체합니다.")
    public ResponseEntity<Result<?>> changeProfileImage(@RequestHeader("Authorization") String authorizationHeader,
                                                        @RequestPart(required = false) MultipartFile file) {
        String url = userService.updateProfileImage(authorizationHeader, file);
        return ResponseEntity.ok(Result.successResult(url));
    }

}
