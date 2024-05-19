package com.jumunseo.community.domain.board.dto;

import com.jumunseo.community.domain.board.entity.CATEGORY;
import lombok.Getter;

import java.util.List;

@Getter
public class BoardRequestDto {
    CATEGORY category;
    String userId;
    String title;
    String content;
    List<String> imageUrl;
}
