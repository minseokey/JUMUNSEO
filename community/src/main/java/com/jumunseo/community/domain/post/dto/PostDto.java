package com.jumunseo.community.domain.post.dto;

import java.sql.Date;
import java.util.List;

import com.jumunseo.community.domain.post.entity.CategoryType;
import com.jumunseo.community.domain.post.entity.Image;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class PostDto {

    private Long id;
    private CategoryType categoryType;
    private String userId;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;
    private Long viewCount;
    private String title;
    private String content;
    private List<Image> images;

    @Builder
    public PostDto(Long id, CategoryType categoryType, String userId, Date createdAt, Date updatedAt, Date deletedAt,
            Long viewCount, String title, String content, List<Image> images) {
        this.id = id;
        this.categoryType = categoryType;
        this.userId = userId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.deletedAt = deletedAt;
        this.viewCount = viewCount;
        this.title = title;
        this.content = content;
        this.images = images;
    }
}
