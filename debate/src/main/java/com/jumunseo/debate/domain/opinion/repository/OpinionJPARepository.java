package com.jumunseo.debate.domain.opinion.repository;

import com.jumunseo.debate.domain.opinion.dto.OpinionDto;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.subject.entity.Subject;
import org.springframework.data.domain.Slice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OpinionJPARepository extends JpaRepository<Opinion, Long> {

    List<Opinion> findBySubjectAndSide(Subject subject, MessageSide side);

    @Query("SELECT o FROM Opinion o WHERE o.subject.id = :subjectId AND o.id BETWEEN :last AND :last + 10 ORDER BY o.id DESC")
    Slice<OpinionDto> findBySubjectIdWithLast(Long subjectId, Long last);

    Optional<Opinion> findBySubjectIdAndUserId(Long subjectId, Long userId);
}
