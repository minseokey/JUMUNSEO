package com.jumunseo.debate.domain.subject.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class SubjectCollectDto {
    private String contents;
}
