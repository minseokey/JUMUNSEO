package com.jumunseo.debate.global.open_ai;

import com.jumunseo.debate.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequiredArgsConstructor
public class TestAIController {

    private final OpenAIService service;

    @PostMapping("/test")
    public ResponseEntity<Result<?>> test(@RequestBody String message) {
        String res = service.sendRequest(message);
        return ResponseEntity.ok(Result.successResult(res));
    }
}
