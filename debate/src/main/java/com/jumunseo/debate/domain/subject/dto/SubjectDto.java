package com.jumunseo.debate.domain.subject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
public class SubjectDto {
    private String contents;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    private Long Id;
}
