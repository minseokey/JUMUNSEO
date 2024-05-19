package com.jumunseo.community.domain.board.dto;

import com.jumunseo.community.domain.board.entity.CATEGORY;
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
    CATEGORY category;
    String userId;
    String title;
    String content;
    List<String> imageUrl;
    Long viewCount;
    Long likeCount;
    Long commentCount;
    LocalDateTime createdAt;
    LocalDateTime updatedAt;
    boolean my_Like;

    @Builder
    private BoardResponseDto(Long id,CATEGORY category, String userId, String title, String content, List<String> imageUrl, Long viewCount, Long likeCount, Long commentCount, LocalDateTime createdAt, LocalDateTime updatedAt) {
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
    }
}
