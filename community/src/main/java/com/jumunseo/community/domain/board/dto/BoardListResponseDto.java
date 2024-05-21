package com.jumunseo.community.domain.board.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class BoardListResponseDto {
    String title;
    String content;
    Long id;
    Long viewCount;

    @Builder
    public BoardListResponseDto(String title, String content, Long id, Long viewCount) {
        this.title = title;
        this.content = content;
        this.id = id;
        this.viewCount = viewCount;
    }
}
