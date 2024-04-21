package com.jumunseo.debate.domain.opinion.repository;

import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.subject.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OpinionJPARepository extends JpaRepository<Opinion, Long> {

    List<Opinion> findBySubjectAndSide(Subject subject, MessageSide side);
}
