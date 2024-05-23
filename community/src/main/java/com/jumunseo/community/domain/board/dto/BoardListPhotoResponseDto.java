package com.jumunseo.community.domain.board.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@NoArgsConstructor
public class BoardListPhotoResponseDto {
    String title;
    String content;
    Long id;
    Long viewCount;
    String category;
    String userId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime createdAt;
    List<String> imageUrl;

    @Builder
    public BoardListPhotoResponseDto(String title, String content, Long id, Long viewCount, String category, String userId, LocalDateTime createdAt, List<String> imageUrl) {
        this.title = title;
        this.content = content;
        this.id = id;
        this.viewCount = viewCount;
        this.category = category;
        this.userId = userId;
        this.createdAt = createdAt;
        this.imageUrl = imageUrl;
    }
}
