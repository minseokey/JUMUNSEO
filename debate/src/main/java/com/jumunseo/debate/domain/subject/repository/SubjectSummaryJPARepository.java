package com.jumunseo.debate.domain.subject.repository;

import com.jumunseo.debate.domain.subject.entity.SubjectSummary;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SubjectSummaryJPARepository extends JpaRepository<SubjectSummary, Long> {
}
