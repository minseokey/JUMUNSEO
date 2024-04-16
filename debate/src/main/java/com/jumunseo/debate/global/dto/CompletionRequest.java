package com.jumunseo.debate.global.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Value;

@Getter
@ToString
@NoArgsConstructor
public class CompletionRequest {
    // 모델과 temperature는 OpenAI API에 전송할 때 사용되는 변수, 고정한다
    private final String model = "gpt-3.5-turbo-instruct";
    private String prompt;
    private final double temperature = 0;
    private final int max_tokens = 1000;

    @Builder
    public CompletionRequest(String messages) {
        this.prompt = messages;
    }
}
