package com.jumunseo.community.domain.comment.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CommentRequestDto {
    private String userId;
    private String content;
    private Long boardId;
    private Long headCommentId;
}
