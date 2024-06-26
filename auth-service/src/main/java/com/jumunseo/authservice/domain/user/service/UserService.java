package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UpdateDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface UserService {

    UserDto findUserById(Long Id);
    UserDto findUserByEmail(String email);
    void saveUser(SignupDto signupDto);

    UserDto findUserByToken(String token);
    List<UserDto> findUsersByIds(List<Long> userIds);
    UpdateDto updateUser(String token, Map<String,String> updateInfo);
    void deleteUser(String token);
    void deleteUserByEmail(String email);
    boolean duplicateEmailCheck(String email);
    void addBlockList(String token, String blockUserId);
    void deleteBlockList(String token, String blockUserId);
    List<String> getBlockList(String token);
    String updateProfileImage(String token, MultipartFile file);
}
