package com.jumunseo.community.global.redis;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.community.domain.board.controller.BoardCommandController;
import com.jumunseo.community.domain.board.dto.BoardRequestDto;
import com.jumunseo.community.domain.comment.controller.CommentCommandController;
import com.jumunseo.community.domain.comment.dto.CommentRequestDto;
import com.jumunseo.community.global.dto.RedisRequest;
import com.jumunseo.community.global.exception.CommandDiffException;
import com.jumunseo.community.global.exception.RedisReceivingException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.connection.MessageListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;


@RequiredArgsConstructor
@Service
public class RedisSubService implements MessageListener {
    private final RedisTemplate<String,Object> redisTemplate;
    private final ObjectMapper objectMapper;
    private final BoardCommandController boardController;
    private final CommentCommandController commentController;

    // Redis에서 메시지(sub)를 받았을 때 실행되는 메소드
    @Override
    public void onMessage(Message message, byte[] pattern) {
        try {
            // 받은 메시지를 String으로 변환
            String publishMessage = redisTemplate.getStringSerializer().deserialize(message.getBody());
            // 받은 메시지를 request 객체로 변환
            RedisRequest received = objectMapper.readValue(publishMessage, RedisRequest.class);

            if (received.getCommand().equals("Board_Create")) {
                BoardRequestDto boardRequestDto = objectMapper.readValue(received.getData(), BoardRequestDto.class);
                boardController.createBoard(boardRequestDto);

            } else if (received.getCommand().equals("Board_Delete")) {
                Long boardId = objectMapper.readValue(received.getData(), Long.class);
                boardController.deleteBoard(boardId);

            } else if (received.getCommand().equals("Board_Update")) {
                BoardRequestDto boardRequestDto = objectMapper.readValue(received.getData(), BoardRequestDto.class);
                Long boardId = objectMapper.readValue(received.getData(), Long.class);
                boardController.updateBoard(boardRequestDto, boardId);

            } else if (received.getCommand().equals("Board_Like")) {
                Long boardId = objectMapper.readValue(received.getData(), Long.class);
                String email = objectMapper.readValue(received.getEmail(), String.class);
                boardController.toggleLike(boardId, email);

            } else if (received.getCommand().equals("Comment_Create")) {
                CommentRequestDto commentRequestDto = objectMapper.readValue(received.getData(), CommentRequestDto.class);
                commentController.createComment(commentRequestDto);

            } else if (received.getCommand().equals("Comment_Delete")) {
                Long commentId = objectMapper.readValue(received.getData(), Long.class);
                commentController.deleteComment(commentId);

            } else {
                throw new CommandDiffException("명령어가 일치하지 않습니다.");
            }
        } catch (Exception e) {
            throw new RedisReceivingException("메시지 변환 중 오류가 발생했습니다.");
        }
    }
}
