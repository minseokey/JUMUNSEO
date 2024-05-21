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

    @Lob
    private String leftOpinions;

    @Lob
    private String rightOpinions;

    @Lob
    private String allOpinions;

    private int countLeft;
    private int countRight;

    @Builder
    public SubjectSummary(Subject subject, String leftOpinions, String rightOpinions, String allOpinions ,int countLeft, int countRight) {
        this.subject = subject;
        this.leftOpinions = leftOpinions;
        this.rightOpinions = rightOpinions;
        this.allOpinions = allOpinions;
        this.countLeft = countLeft;
        this.countRight = countRight;
    }
}
