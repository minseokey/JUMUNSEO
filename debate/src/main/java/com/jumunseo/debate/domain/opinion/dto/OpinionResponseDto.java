package com.jumunseo.debate.domain.opinion.dto;

import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class OpinionResponseDto {
    private String content;
    private MessageType type;
    private MessageSide side;
    private String userEmail;
    private Long id;
}
