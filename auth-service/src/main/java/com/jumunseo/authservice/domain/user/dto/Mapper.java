package com.jumunseo.authservice.domain.user.dto;

import com.jumunseo.authservice.domain.user.entity.User;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class Mapper {

    public UserDto toDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setEmail(user.getEmail());
        userDto.setRole(user.getRole());
        return userDto;
    }

    public User toEntity(UserDto userDto) {
        User user = new User();
        user.setEmail(userDto.getEmail());
        user.setRole(userDto.getRole());
        return user;
    }


    public List<UserDto> toDtoList(List<User> users) {
        List<UserDto> userDtos = new ArrayList<>();
        for (User user : users) {
            userDtos.add(toDto(user));
        }
        return userDtos;
    }

    public List<User> toEntityList(List<UserDto> userDtos) {
        List<User> users = new ArrayList<>();
        for (UserDto userDto : userDtos) {
            users.add(toEntity(userDto));
        }
        return users;
    }

}
