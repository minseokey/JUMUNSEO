package com.jumunseo.debate.domain.subject.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class SubjectDto {
    private String contents;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}
