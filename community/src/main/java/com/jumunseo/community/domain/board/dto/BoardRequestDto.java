package com.jumunseo.community.domain.board.dto;

import lombok.Getter;

import java.util.List;

@Getter
public class BoardRequestDto {
    String category;
    String userId;
    String title;
    String content;
    List<String> imageUrl;
    String dataId;
}
