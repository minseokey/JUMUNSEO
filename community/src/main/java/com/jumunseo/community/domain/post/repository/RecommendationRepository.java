package com.jumunseo.community.domain.post.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jumunseo.community.domain.post.entity.Recommendation;

@Repository
public interface RecommendationRepository extends JpaRepository<Recommendation, Long> {
    Recommendation findByUserIdAndPostId(String userId, Long postId);
}
