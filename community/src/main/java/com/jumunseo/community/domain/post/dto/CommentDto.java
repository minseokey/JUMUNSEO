package com.jumunseo.community.domain.post.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class CommentDto {

    private Long id;
    private Long post;
    private String userId;
    private String content;
    private Long parentId;
    private Date createdAt;
    private Date updatedAt;
    private Date deletedAt;

    @Builder
    public CommentDto(Long id, Long post, String userId, String content, Long parentId, Date createdAt, Date updatedAt,
            Date deletedAt) {
        this.id = id;
        this.post = post;
        this.userId = userId;
        this.content = content;
        this.parentId = parentId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.deletedAt = deletedAt;
    }
}
