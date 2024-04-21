package com.jumunseo.debate.domain.subject.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
public class SubjectDto {
    private String contents;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}
