package com.jumunseo.debate.domain.opinion.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.MessageType;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class OpinionDto {
    private String content;
    private MessageType type;
    private MessageSide side;
    private Long subjectId;

    // Username은 Composite에서 추가하는걸로.
    private String userEmail;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime time;

    @Builder
    public OpinionDto(String content, MessageType type, MessageSide side, Long subjectId, String userEmail, LocalDateTime time){
        this.content = content;
        this.type = type;
        this.side = side;
        this.subjectId = subjectId;
        this.userEmail = userEmail;
        this.time = time;
    }

}
