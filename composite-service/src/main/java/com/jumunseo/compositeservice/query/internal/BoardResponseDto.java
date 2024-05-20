package com.jumunseo.compositeservice.query.internal;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class BoardResponseDto {
    Long id;
    String category;
    String userId;
    String title;
    String content;
    List<String> imageUrl;
    Long viewCount;
    Long likeCount;
    Long commentCount;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime createdAt;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime updatedAt;
    String dataId;
    boolean my_Like;

    @Builder
    private BoardResponseDto(Long id, String category, String userId, String title, String content, List<String> imageUrl, Long viewCount, Long likeCount, Long commentCount, LocalDateTime createdAt, LocalDateTime updatedAt, String dataId) {
        this.id = id;
        this.category = category;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.imageUrl = imageUrl;
        this.viewCount = viewCount;
        this.likeCount = likeCount;
        this.commentCount = commentCount;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.dataId = dataId;
    }
}
