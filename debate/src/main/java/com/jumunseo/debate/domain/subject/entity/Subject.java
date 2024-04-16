package com.jumunseo.debate.domain.subject.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@Table(name = "subject")
@NoArgsConstructor
public class Subject {

    @Id
    private Long id;

    // 12시에 한번씩 업로드 되는 주제 + Cron 사용
    private String contents;

    private LocalDateTime startTime;
    private LocalDateTime endTime;

    @Builder
    public Subject(Long id, String contents, LocalDateTime startDate){
        this.id = id;
        this.contents = contents;
        this.startTime = LocalDateTime.now();
        this.endTime = startDate.plusDays(1);
    }
}
