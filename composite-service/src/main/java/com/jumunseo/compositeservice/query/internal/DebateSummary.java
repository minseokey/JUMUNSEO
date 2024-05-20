package com.jumunseo.compositeservice.query.internal;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class DebateSummary {
    Long id;
    String leftOpinions;
    String rightOpinions;
    String allOpinions;
    Long countLeft;
    Long countRight;
    Object subject;
}
