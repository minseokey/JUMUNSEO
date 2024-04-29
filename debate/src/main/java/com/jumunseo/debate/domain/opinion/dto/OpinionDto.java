package com.jumunseo.debate.domain.opinion.dto;

import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
public class OpinionDto {
    private String content;
    private MessageType type;
    private MessageSide side;
    private Long subjectId;

    // Username은 Composite에서 추가하는걸로.
    private Long userId;

    @Builder
    public OpinionDto(String content, MessageType type, MessageSide side, Long subjectId, Long userId, String userName){
        this.content = content;
        this.type = type;
        this.side = side;
        this.subjectId = subjectId;
        this.userId = userId;
    }

}
