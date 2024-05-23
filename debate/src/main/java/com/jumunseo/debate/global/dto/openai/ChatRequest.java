package com.jumunseo.debate.global.dto.openai;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter
@ToString
@NoArgsConstructor
public class ChatRequest {
    // 모델과 temperature는 OpenAI API에 전송할 때 사용되는 변수, 고정한다
    private final String model = "gpt-4-turbo";
    private List<Message> messages;
    private final double temperature = 0.7;
    private final int max_tokens = 2000;
    private final int top_p = 1;

    @Builder
    public ChatRequest(List<String> prompts, String sysMessage) {
        this.messages = new ArrayList<>();
        this.messages.add(new Message("system", sysMessage));
        // 여러 프롬프트를 추가할 수 있게
        for (String prompt : prompts) {
            this.messages.add(new Message("user", prompt));
        }
    }
}
