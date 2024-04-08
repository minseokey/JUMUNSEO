package com.jumunseo.compositeservice.command.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.compositeservice.command.dto.CommandDto;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.aspectj.bridge.ICommand;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class KafkaService {
    private final KafkaTemplate<String, String> kafkaTemplate;
    public void send(String topic, CommandDto data) throws JsonProcessingException {
        // 보내기전의 모든 데이터 (CommandDto)를 String으로 변환. -> 만약 받은뒤에 내부 정보를 열고싶으면 두번 변환해야함.
        ObjectMapper objectMapper = new ObjectMapper();
        String dataStr = objectMapper.writeValueAsString(data);
        kafkaTemplate.send(topic, dataStr);
    }
    // normal
    public CommandDto setMessage(HttpServletRequest request, CommandDto data, String body, String command) {
        data.setEmail(request.getAttribute("email").toString());
        data.setRole(request.getAttribute("role").toString());
        data.setName(request.getAttribute("name").toString());
        data.setCommand(command);
        data.setData(body);
        return data;
    }
}
