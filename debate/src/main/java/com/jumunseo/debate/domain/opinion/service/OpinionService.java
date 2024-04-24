package com.jumunseo.debate.domain.opinion.service;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.dto.OpinionResponseDto;
import com.jumunseo.debate.domain.opinion.entity.Opinion;

import java.util.List;

public interface OpinionService {

    // 메시지 보내기
    void sendMessage(String channel, OpinionDto opinion);

    List<OpinionResponseDto> getOpinionByLast(Long subjectId, Long last);

    String getSide(Long subjectId, Long userId);
}
