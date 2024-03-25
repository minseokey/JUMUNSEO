package com.jumunseo.authservice.controller.user;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.authservice.domain.user.controller.UserController;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.service.UserService;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import org.junit.jupiter.api.AfterEach;
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

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

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
    private UserService userService;

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
        if (userService.findUserByEmail("Test") != null) {
            userService.deleteUserByEmail("Test");
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
    //Post Test
    void signIn() {
    }

    @Test
    @DisplayName("회원정보 수정 테스트")
    //Put Test
    void updateUserInfo() {
    }

    @Test
    @DisplayName("회원탈퇴 테스트")
    //Delete Test
    void deleteUser() {
    }

    @Test
    @DisplayName("회원정보 토큰 조회 테스트")
    //Get Test
    void getUserInfoByToken() {
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
