package com.jumunseo.compositeservice.query.internal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class DebateSummary {
    Long id;
    String leftOpinions;
    String rightOpinions;
    String allOpinions;
    int countLeft;
    int countRight;
    Object subject;
}
