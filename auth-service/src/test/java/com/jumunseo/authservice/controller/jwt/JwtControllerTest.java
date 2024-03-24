package com.jumunseo.authservice.controller.jwt;

import com.jumunseo.authservice.domain.jwt.controller.JwtController;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.service.UserService;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
public class JwtControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private JwtController jwtController;
    @Autowired
    private JwtTokenProvider jwtTokenProvider;
    @Autowired
    private UserService userService;

    @BeforeEach
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
    @DisplayName("토큰 갱신 테스트")
    //Get Test
    void refreshToken() {


    }

    @Test
    @DisplayName("로그아웃 테스트")
    //Get Test
    void logout() {
    }

}
