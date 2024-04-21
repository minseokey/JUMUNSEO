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

    // 유저 정보중 이메일은 안필요할듯?
    // 디스플레이시에는 유저네임만, 차단 관리는 UserId로.
    private Long userId;
    private String userName;

    @Builder
    public OpinionDto(String content, MessageType type, MessageSide side, Long subjectId, Long userId, String userName){
        this.content = content;
        this.type = type;
        this.side = side;
        this.subjectId = subjectId;
        this.userId = userId;
        this.userName = userName;
    }

}
