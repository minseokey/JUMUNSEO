package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.user.dto.UserDto;

public interface UserService {
    UserDto findUserById(Long Id);
    UserDto findUserByEmail(String email);
    void saveUser(UserDto userDto);
}
