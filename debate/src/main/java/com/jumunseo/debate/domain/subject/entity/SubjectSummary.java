package com.jumunseo.debate.domain.subject.entity;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class SubjectSummary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "subject_id")
    private Subject subject;

    private String leftOpinions;

    private String rightOpinions;

    @Builder
    public SubjectSummary(Subject subject, String leftOpinions, String rightOpinions) {
        this.subject = subject;
        this.leftOpinions = leftOpinions;
        this.rightOpinions = rightOpinions;
    }
}
