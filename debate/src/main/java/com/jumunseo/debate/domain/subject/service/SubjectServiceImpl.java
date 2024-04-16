package com.jumunseo.debate.domain.subject.service;

import com.jumunseo.debate.domain.subject.dto.SubjectDto;
import com.jumunseo.debate.domain.subject.repository.SubjectJPARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SubjectServiceImpl implements SubjectService{

    private final SubjectJPARepository subjectJPARepository;

    // 매일 자정에 주제를 새로고침한다.
    @Scheduled(cron = "0 0 0 * * *")
    public void summarySubject(){

    }

    // 주제를 추가한다.
    // OpenAI 기반
    @Scheduled(cron = "0 0 0 * * *")
    public void addSubject(){

    }


    // 현재 사용가능한 주제를 가져온다.
    public List<SubjectDto> getLiveSubject(){
        return subjectJPARepository.findByStartTimeAfterAndEndTimeBefore(LocalDateTime.now(), LocalDateTime.now().plusDays(1));
    }

}
