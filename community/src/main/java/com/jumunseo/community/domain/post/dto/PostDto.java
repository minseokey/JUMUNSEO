package com.jumunseo.community.domain.post.dto;

import java.sql.Date;

import javax.xml.crypto.Data;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class PostDto {
    private Long id;
    private String userId;
    private Date createdAt;
    private Date updatedAt;
    private String title;
    private String content;

    @Builder
    public PostDto(Long id, String userId, Date createdAt, Date updatedAt, String title, String content) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.title = title;
        this.content = content;
    }
}
