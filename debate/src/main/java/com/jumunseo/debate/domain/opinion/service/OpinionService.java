package com.jumunseo.debate.domain.opinion.service;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import org.springframework.data.domain.Slice;

public interface OpinionService {

    // 메시지 보내기
    void sendMessage(String channel, OpinionDto opinion);

    Slice<OpinionDto> getOpinionByLast(Long subjectId, Long last);

    String getSide(Long subjectId, Long userId);
}
