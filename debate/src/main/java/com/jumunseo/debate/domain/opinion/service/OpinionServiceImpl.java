package com.jumunseo.debate.domain.opinion.service;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.dto.OpinionResponseDto;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.opinion.repository.OpinionJPARepository;
import com.jumunseo.debate.domain.subject.exception.TimeoutSubjectException;
import com.jumunseo.debate.domain.subject.service.SubjectService;
import com.jumunseo.debate.global.dto.Mapper;
import com.jumunseo.debate.global.stomp.RedisChannelService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OpinionServiceImpl implements OpinionService{
    private final OpinionJPARepository opinionRepository;
    private final SubjectService subjectService;
    private final Mapper mapper;
    private final RedisTemplate<String, Object> redisTemplate;
    private final RedisChannelService redisChannelService;


    @Override
    @Transactional
    public void sendMessage(String channel, OpinionDto opinionDto) {

        // opinion을 받아서 해당 주제에 opinion을 추가한다.
        // 1. 아직 주제가 살아있는가?
        if(!subjectService.isValidSubject(opinionDto.getSubjectId())){
            throw new TimeoutSubjectException("주제의 시간이 만료되었습니다.");
        }
        // 2. opinion을 저장한다.
        opinionRepository.save(mapper.toEntity(opinionDto));
        // 3. opinion을 채팅방에 전달한다(레디스에 올린다).
        redisTemplate.convertAndSend(channel, opinionDto);
    }

    @Override
    @Transactional
    public List<OpinionResponseDto> getOpinionByLast(Long subjectId, Long last) {
        // 만약 -1이면 최신꺼 기준 10개
        if(last == -1){
            return opinionRepository.findTop10BySubjectIdOrderByIdDesc(subjectId);
        }
        // 그게 아니라면 기준점 기준 앞으로 10개 리턴.
        else {
            return opinionRepository.find10BySubjectIdWithLast(subjectId, last);
        }
    }

    @Override
    public String getSide(Long subjectId, String userEmail) {
        try {
            Opinion opinion = opinionRepository.findTop1BySubjectIdAndUserEmailOrderById(subjectId, userEmail).orElseThrow();
            return opinion.getSide().toString();
        } catch (Exception e) {
            return "-1";
        }
    }

    // 테스트용
    public void test(OpinionDto opinionDto){
        redisChannelService.registerChannel(opinionDto.getSubjectId().toString());
        redisTemplate.convertAndSend(opinionDto.getSubjectId().toString(), opinionDto);
    }
}
