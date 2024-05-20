package com.jumunseo.compositeservice.command.dto.external;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommentRequestDto {
    private String userId;
    private String content;
    private Long boardId;
    private Long headCommentId;
}
