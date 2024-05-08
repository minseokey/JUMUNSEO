package com.jumunseo.community.domain.post.dto;

import java.util.Date;

import com.jumunseo.community.domain.post.entity.Post;
import com.jumunseo.community.domain.post.entity.RecommendationType;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class RecommendationDto {

    private Long id;
    private Post post;
    private String userId;
    private RecommendationType isRecommend;
    private Date createdAt;
    private Date deletedAt;

    @Builder
    public RecommendationDto(Long id, Post post, String userId, RecommendationType isRecommend, Date createdAt,
            Date deletedAt) {
        this.id = id;
        this.post = post;
        this.userId = userId;
        this.isRecommend = isRecommend;
        this.createdAt = createdAt;
        this.deletedAt = deletedAt;
    }
}
