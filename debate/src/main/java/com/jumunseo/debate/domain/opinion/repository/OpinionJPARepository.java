package com.jumunseo.debate.domain.opinion.repository;

import com.jumunseo.debate.domain.opinion.dto.OpinionResponseDto;
import com.jumunseo.debate.domain.opinion.dto.OpinionSimpleDto;
import com.jumunseo.debate.domain.opinion.entity.MessageSide;
import com.jumunseo.debate.domain.opinion.entity.Opinion;
import com.jumunseo.debate.domain.subject.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface OpinionJPARepository extends JpaRepository<Opinion, Long> {
    // subject 를 사용하지 않는다 -> fetchjoin 불필요
    @Query("SELECT new com.jumunseo.debate.domain.opinion.dto.OpinionSimpleDto(o.side,o.content,o.subject.id) FROM Opinion o WHERE o.subject = :subject AND o.side = :side")
    List<OpinionSimpleDto> findBySubjectAndSide(Subject subject, MessageSide side);
    // select시에 Eager 혹은 Fetchjoin 으로 subject 를 가져오지 않으면 where문에서 비교하며 lazy 로딩, lob 트랜잭션 문제가 걸린다.
    // 따라서 Fetchjoin 해주기. Eager는 다른 로직에 시간+ 를 불러올 수 있다.
    @Query("SELECT new com.jumunseo.debate.domain.opinion.dto.OpinionResponseDto(o.content,o.type,o.side,o.userEmail,o.id,o.time) FROM Opinion o WHERE o.subject.id = :subjectId AND o.id BETWEEN :last AND :last + 10 ORDER BY o.id DESC")
    List<OpinionResponseDto> find10BySubjectIdWithLast(Long subjectId, Long last);
    @Query("SELECT new com.jumunseo.debate.domain.opinion.dto.OpinionResponseDto(o.content,o.type,o.side,o.userEmail,o.id,o.time) FROM Opinion o WHERE o.subject.id = :subjectId ORDER BY o.id DESC LIMIT 10")
    List<OpinionResponseDto> findTop10BySubjectIdOrderByIdDesc(Long subjectId);
    Optional<Opinion> findTop1BySubjectIdAndUserEmailOrderById(Long subjectId, String userEmail);
}
