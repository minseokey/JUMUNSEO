package com.jumunseo.debate.domain.opinion.service;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.dto.OpinionSimpleDto;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.repository.OpinionJPARepository;
import com.jumunseo.debate.domain.subject.entity.Subject;
import com.jumunseo.debate.domain.subject.exception.TimeoutSubjectException;
import com.jumunseo.debate.domain.subject.service.SubjectService;
import com.jumunseo.debate.global.dto.Mapper;
import com.jumunseo.debate.global.stomp.RedisChannelService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OpinionServiceImpl implements OpinionService{
    private final OpinionJPARepository opinionRepository;
    private final SubjectService subjectService;
    private final Mapper mapper;
    private final RedisTemplate<String, Object> redisTemplate;

    // 테스트용
    private final RedisChannelService redisChannelService;


    @Override
    public void sendMessage(OpinionDto opinionDto) {

        // opinion을 받아서 해당 주제에 opinion을 추가한다.
        // 1. 아직 주제가 살아있는가?
        if(!subjectService.isValidSubject(opinionDto.getSubjectId())){
            throw new TimeoutSubjectException("주제의 시간이 만료되었습니다.");
        }
        // 2. opinion을 저장한다.
        opinionRepository.save(mapper.toEntity(opinionDto));

        // 3. opinion을 채팅방에 전달한다(레디스에 올린다).
        redisTemplate.convertAndSend(opinionDto.getSubjectId().toString(), opinionDto);

    }

    // 테스트용
    public void test(OpinionDto opinionDto){
        redisChannelService.registerChannel(opinionDto.getSubjectId().toString());
        redisTemplate.convertAndSend(opinionDto.getSubjectId().toString(), opinionDto);
    }
}
