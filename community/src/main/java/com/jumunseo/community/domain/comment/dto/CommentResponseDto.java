package com.jumunseo.community.domain.comment.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CommentResponseDto {
    private Long id;
    private String userId;
    private String content;
    private Long headCommentId;

    @Builder
    public CommentResponseDto(Long id, String userId, String content, Long headCommentId) {
        this.id = id;
        this.userId = userId;
        this.content = content;
        this.headCommentId = headCommentId;
    }
}
