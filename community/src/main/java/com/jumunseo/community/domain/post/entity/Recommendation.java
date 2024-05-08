package com.jumunseo.community.domain.post.entity;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "recommendations")
@Getter
@NoArgsConstructor
public class Recommendation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "post_id", nullable = false)
    private Post post;

    @Column(name = "user_id", length = 50, nullable = false)
    private String userId;

    @Enumerated(value = EnumType.STRING)
    @Column(name = "is_recommend", nullable = false)
    private RecommendationType recommendationType;

    @Column(name = "created_at", nullable = false)
    private Date createdAt;

    @Column(name = "deleted_at")
    private Date deletedAt;

    @Builder
    public Recommendation(Long id, Post post, String userId, RecommendationType recommendationType, Date createdAt,
            Date deletedAt) {
        this.id = id;
        this.post = post;
        this.userId = userId;
        this.recommendationType = recommendationType;
        this.createdAt = createdAt;
        this.deletedAt = deletedAt;
    }
}
