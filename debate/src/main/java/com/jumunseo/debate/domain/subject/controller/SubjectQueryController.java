package com.jumunseo.debate.domain.subject.controller;

import com.jumunseo.debate.domain.subject.service.SubjectService;
import com.jumunseo.debate.global.dto.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/debate/subject")
public class SubjectQueryController {

    private final SubjectService subjectService;
    // 사용가능한 주제 목록 조회
    @GetMapping("/available")
    public ResponseEntity<Result<?>> getAvailableSubjectList() {
        return ResponseEntity.ok().body(Result.successResult(subjectService.getLiveSubject()));
    }
}
