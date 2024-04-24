package com.jumunseo.debate.domain.subject.entity;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.Duration;

@Entity
@Getter
@Setter
@Table(name = "subject")
@NoArgsConstructor
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 12시에 한번씩 업로드 되는 주제 + Cron 사용
    @Lob
    private String contents;

    private LocalDateTime startTime;
    private LocalDateTime endTime;

    @Builder
    public Subject(String contents, Duration term){
        this.contents = contents;
        this.startTime = LocalDateTime.now();
        this.endTime = startTime.plus(term);
    }
}
