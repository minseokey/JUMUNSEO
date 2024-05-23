package com.jumunseo.compositeservice.query.internal;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class BoardResponseAdditionDto {
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
    Object data;

    @Builder
    private BoardResponseAdditionDto(Object data, BoardResponseDto boardResponseDto) {
        this.id = boardResponseDto.getId();
        this.category = boardResponseDto.getCategory();
        this.userId = boardResponseDto.getUserId();
        this.title = boardResponseDto.getTitle();
        this.content = boardResponseDto.getContent();
        this.imageUrl = boardResponseDto.getImageUrl();
        this.viewCount = boardResponseDto.getViewCount();
        this.likeCount = boardResponseDto.getLikeCount();
        this.commentCount = boardResponseDto.getCommentCount();
        this.createdAt = boardResponseDto.getCreatedAt();
        this.updatedAt = boardResponseDto.getUpdatedAt();
        this.dataId = boardResponseDto.getDataId();
        this.my_Like = boardResponseDto.isMy_Like();
        this.data = data;
    }
}
