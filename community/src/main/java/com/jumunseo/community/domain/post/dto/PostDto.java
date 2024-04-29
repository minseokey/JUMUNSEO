package com.jumunseo.community.domain.post.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class PostDto {
    private Long id;
    private Long userId;
    private Long createdAt;
    private String title;
    private String content;

    @Builder
    public PostDto(Long id, Long userId, Long createdAt, String title, String content) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
        this.title = title;
        this.content = content;
    }
}
