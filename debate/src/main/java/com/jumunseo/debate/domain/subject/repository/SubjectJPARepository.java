package com.jumunseo.debate.domain.subject.repository;

import com.jumunseo.debate.domain.subject.dto.SubjectDto;
import com.jumunseo.debate.domain.subject.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface SubjectJPARepository extends JpaRepository<Subject, Long> {
    List<SubjectDto> findByStartTimeAfterAndEndTimeBefore(LocalDateTime startTime, LocalDateTime endTime);
}
