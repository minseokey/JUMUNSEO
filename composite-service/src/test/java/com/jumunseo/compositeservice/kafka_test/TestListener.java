package com.jumunseo.compositeservice.kafka_test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.compositeservice.global.security.JwtProvider;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import java.util.Map;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@ContextConfiguration(classes = TestKafkaConfig.class)
public class TestListener {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private JwtProvider jwtProvider;

    ObjectMapper objectMapper = new ObjectMapper();
    Map<String,Object> map;


    @KafkaListener(topics = "test", groupId = "test")
    public void listen(String message) throws JsonProcessingException {
        // 받은 데이터를 Map으로 변환 -> with 토큰정보 & 데이터
        map = objectMapper.readValue(message, new TypeReference<>() {});
    }

    @Test
    @DisplayName("카프카 통신 ,인증 테스트")
    public void kafka_send() throws Exception {
        ResultActions resultActions = mockMvc.perform(MockMvcRequestBuilders.post("/command/test")
                .header("Authorization", "Bearer " + jwtProvider.createTestAccessToken())
                .contentType("application/json")
                .content("{\"test1\":\"Test\",\"test2\":\"Test2\"}"));

        resultActions.andExpect(status().isOk())
                .andExpect(jsonPath("code").value("SUCCESS"))
                .andExpect(jsonPath("message").value(""));

        Thread.sleep(2000);
        System.out.println(map);
        assert map.get("command").equals("do test");
        assert map.get("email").equals("test");

    }
}
