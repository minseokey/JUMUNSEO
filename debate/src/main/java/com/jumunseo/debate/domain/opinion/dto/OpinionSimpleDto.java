package com.jumunseo.debate.domain.opinion.dto;

import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
// 요약용 DTO
public class OpinionSimpleDto {
    private MessageSide side;
    private String content;
    private Long subjectId;

}
