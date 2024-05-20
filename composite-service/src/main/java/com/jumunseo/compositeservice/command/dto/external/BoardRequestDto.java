package com.jumunseo.compositeservice.command.dto.external;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class BoardRequestDto {
    String category;
    String userId;
    String title;
    String content;
    List<String> imageUrl;
    String dataId;
}
