package com.jumunseo.community.domain.post.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString
public class UserDto {

    private String userId;
    private String role;
    private String nickName;

    @Builder
    public UserDto(String userId, String role, String nickName) {
        this.userId = userId;
        this.role = role;
        this.nickName = nickName;
    }
}
