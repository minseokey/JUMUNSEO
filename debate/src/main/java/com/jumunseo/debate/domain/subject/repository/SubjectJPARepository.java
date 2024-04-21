package com.jumunseo.debate.domain.subject.repository;

import com.jumunseo.debate.domain.subject.dto.SubjectCollectDto;
import com.jumunseo.debate.domain.subject.dto.SubjectDto;
import com.jumunseo.debate.domain.subject.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface SubjectJPARepository extends JpaRepository<Subject, Long> {
    @Query("SELECT s FROM Subject s WHERE :now BETWEEN s.startTime AND s.endTime")
    List<SubjectDto> findByStartTimeAndEndTime(LocalDateTime now);
    List<SubjectCollectDto> findTop100ByStartTime(LocalDateTime startTime);
    Optional<SubjectDto> findSubjectDtoById (Long id);

    // 시간이 막 지난 주제를 가져온다.
    Subject findTopByEndTimeBefore(LocalDateTime endTime);
}
