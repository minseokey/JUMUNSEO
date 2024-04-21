package com.jumunseo.debate.domain.opinion.service;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;

public interface OpinionService {

    // 메시지 보내기
    void sendMessage(OpinionDto opinion);
}
