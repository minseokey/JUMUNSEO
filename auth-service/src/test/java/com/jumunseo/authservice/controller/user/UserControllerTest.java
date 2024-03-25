package com.jumunseo.authservice.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.authservice.domain.user.controller.UserController;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import com.jumunseo.authservice.domain.user.service.UserService;
import com.jumunseo.authservice.global.util.CookieProvider;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.transaction.annotation.Transactional;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
public class UserControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private JwtTokenProvider jwtTokenProvider;
    @Autowired
    private UserController userController;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;
    @Autowired
    private RefreshTokenService refreshTokenService;
    @Autowired
    private CookieProvider cookieProvider;


    void setUp() {
        // 테스트 세팅
        SignupDto testUser = new SignupDto();
        testUser.setEmail("Test");
        testUser.setPassword("Test");
        testUser.setName("Test");
        userService.saveUser(testUser);
    }

    @AfterEach
    void tearDown() {
        // 테스트 종료
        try{
            userService.deleteUserByEmail("Test");
        }
        catch (NotExistUserException ignored) {
        }
    }

    @Test
    @DisplayName("회원가입 테스트")
    @Transactional
    //Post Test
    void signUp() throws Exception{
        // setUp 사용 안한다. 회원 가입하는것 자체가 테스트이기 때문에.
        // Given
        SignupDto testUser = new SignupDto();
        testUser.setEmail("Test");
        testUser.setPassword("Test");
        testUser.setName("Test");

        // When
        ResultActions result = mockMvc.perform(MockMvcRequestBuilders.post("/user/signup")
                .contentType("application/json")
                .content(new ObjectMapper().writeValueAsString(testUser)));

        // Then
        result.andExpect(status().isCreated())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""))
                .andExpect(jsonPath("data").isEmpty());

        // 유저 있는지 확인
        assert userService.findUserByEmail("Test") != null;
    }

    @Test
    @DisplayName("로그인 테스트")
    @Transactional
    //Post Test
    void signIn() throws Exception {
        // Given
        setUp();
        // When
        // 인증과정은 패스
        ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.post("/login")
                .contentType("application/json")
                .content("{\"email\":\"Test\",\"password\":\"Test\"}"));
        // Then
        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""))
                .andExpect(jsonPath("data.accessToken").exists())
                .andExpect(jsonPath("data.expiredTime").exists())
                .andExpect(header().exists("Set-Cookie"))
                .andExpect(cookie().exists("refreshToken"));
    }

    @Test
    @DisplayName("회원정보 수정 테스트")
    @Transactional
    //Put Test
    void updateUserInfo() throws Exception {
        // Given
        setUp();

        // 토큰을 기반으로 수정, 토큰 가져와야함.
        String accessToken = jwtTokenProvider.createAccessToken("Test", "USER");
        String refreshToken = jwtTokenProvider.createRefreshToken();

        // 인증절차 따라하기
        refreshTokenService.updateRefreshToken("Test", jwtTokenProvider.getRefreshTokenId(refreshToken));

        // 쿠키에 refresh 토큰 저장
        cookieProvider.createRefreshTokenCookie(refreshToken);


        // When
        // 아무거나 변경해도 되지안, 이름을 한번 변경해보자.
        ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.put("/user/update")
                .header("Authorization", accessToken)
                .contentType("application/json")
                .content("{\"name\":\"Changed\"}"));

        // Then
        // TODO: 이름 or 이메일 변경시 토큰 재발급 확인
        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""))
                .andExpect(jsonPath("data.email").value("Test"))
                .andExpect(jsonPath("data.name").value("Changed"))
                .andExpect(jsonPath("data.role").value("USER"));

        assert userService.findUserByEmail("Test").getName().equals("Changed");
    }

    @Test
    @DisplayName("회원탈퇴 테스트")
    @Transactional
    //Delete Test
    void deleteUser() throws Exception {
        // Given
        setUp();
        // When
        ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.delete("/user/delete")
                .contentType("application/json")
                .header("Authorization", jwtTokenProvider.createAccessToken("Test", "USER")));
        // Then
        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""))
                .andExpect(jsonPath("data").isEmpty());

        Assertions.assertThrows(NotExistUserException.class,() -> userService.findUserByEmail("Test"));
    }

    @Test
    @DisplayName("회원정보 토큰 조회 테스트")
    @Transactional
    //Get Test
    void getUserInfoByToken() throws Exception {
        // Given
        setUp();
        String accessToken = jwtTokenProvider.createAccessToken("Test", "USER");
        // When
        ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.get("/user/info")
                .header("Authorization", accessToken));
        // Then
        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""))
                .andExpect(jsonPath("data.email").value("Test"))
                .andExpect(jsonPath("data.name").value("Test"))
                .andExpect(jsonPath("data.role").value("USER"));
    }

    @Test
    @DisplayName("회원정보 이메일 조회 테스트")
    //Get Test
    void getUserInfoByEmail() {
    }

    @Test
    @DisplayName("회원정보 아이디 조회 테스트")
    //Get Test
    void getUserInfoById() {
    }

    @Test
    @DisplayName("회원목록 조회 테스트")
    //Get Test
    void getUserList() {
    }

    @Test
    @DisplayName("아이디 중복 테스트")
    //Get Test
    void checkDuplicateId() {
    }
}
