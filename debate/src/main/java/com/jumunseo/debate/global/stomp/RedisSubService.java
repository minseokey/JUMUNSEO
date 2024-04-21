package com.jumunseo.debate.global.stomp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import com.jumunseo.debate.global.exception.MessageConvertError;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class RedisSubService implements MessageListener {
    private final RedisTemplate<String,Object> redisTemplate;
    private final ObjectMapper objectMapper;
    private final SimpMessageSendingOperations messagingTemplate;

    // Redis에서 메시지(sub)를 받았을 때 실행되는 메소드
    // 레디스에서 메시지를 받아서 해당 메시지를 다시 웹소켓으로 전송
    @Override
    public void onMessage(Message message, byte[] pattern) {
        try{
            // 받은 메시지를 String으로 변환
            String publishMessage = redisTemplate.getStringSerializer().deserialize(message.getBody());
            // 받은 메시지를 Opinion 객체로 변환
            OpinionDto received = objectMapper.readValue(publishMessage, OpinionDto.class);
            // Opinion의 타입이 TALK인 경우 /sub/talk/{subjectId}로 메시지 전송
            if (received.getType().equals(MessageType.TALK)){
                messagingTemplate.convertAndSend("/sub/test/" + received.getSubjectId(), received);
            }
        }
        catch (Exception e){
            throw new MessageConvertError("메시지 변환 중 오류가 발생했습니다.");
        }
    }
}
