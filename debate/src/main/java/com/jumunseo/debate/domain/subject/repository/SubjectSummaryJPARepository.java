package com.jumunseo.debate.domain.subject.repository;

import com.jumunseo.debate.domain.subject.entity.SubjectSummary;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SubjectSummaryJPARepository extends JpaRepository<SubjectSummary, Long> {
    Optional<SubjectSummary> findTop1ByOrderByIdDesc();
}
