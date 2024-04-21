package com.jumunseo.debate.global.dto;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.dto.OpinionSimpleDto;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.subject.dto.SubjectDto;
import com.jumunseo.debate.domain.subject.entity.Subject;
import com.jumunseo.debate.domain.subject.exception.NotExistSubjectException;
import com.jumunseo.debate.domain.subject.repository.SubjectJPARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class Mapper {

    private final SubjectJPARepository subjectRepository;

    public Opinion toEntity(OpinionDto opinionRequestDto){
        return Opinion.builder()
                .content(opinionRequestDto.getContent())
                .type(opinionRequestDto.getType())
                .subject(subjectRepository.findById(opinionRequestDto.getSubjectId())
                        .orElseThrow(() -> new NotExistSubjectException("주제가 존재하지 않습니다.")))
                .userId(opinionRequestDto.getUserId())
                .userName(opinionRequestDto.getUserName())
                .build();
    }

    public OpinionDto toDto(Opinion opinion){
        return OpinionDto.builder()
                .content(opinion.getContent())
                .type(opinion.getType())
                .subjectId(opinion.getSubject().getId())
                .userId(opinion.getUserId())
                .userName(opinion.getUserName())
                .build();
    }

    public SubjectDto toDto(Subject subject){
        return SubjectDto.builder()
                .contents(subject.getContents())
                .startTime(subject.getStartTime())
                .endTime(subject.getEndTime())
                .build();
    }

    public Subject toEntity(SubjectDto subjectDto){
        return Subject.builder()
                .contents(subjectDto.getContents())
                .build();
    }

    public OpinionSimpleDto toSimpleOption (Opinion opinion){
        return OpinionSimpleDto.builder()
                .content(opinion.getContent())
                .side(opinion.getSide())
                .subjectId(opinion.getSubject().getId())
                .build();
    }

    public OpinionDto toOptionDto (Opinion opinion){
        return OpinionDto.builder()
                .content(opinion.getContent())
                .type(opinion.getType())
                .side(opinion.getSide())
                .subjectId(opinion.getSubject().getId())
                .userId(opinion.getUserId())
                .userName(opinion.getUserName())
                .build();
    }

}
