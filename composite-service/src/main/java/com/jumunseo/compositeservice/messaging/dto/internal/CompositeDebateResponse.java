package com.jumunseo.compositeservice.messaging.dto.internal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class CompositeDebateResponse {
    String content;
    String MessageType; // enum을 그대로 전달
    String MessageSide; // enum을 그대로 전달
    Long subjectId;
    String userEmail;
}
