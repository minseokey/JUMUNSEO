package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.user.dto.Mapper;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;
    private final Mapper mapper;

    @Override
    public UserDto findUserById(Long Id) throws NotExistUserException{
        return mapper.toDto(userRepository.findById(Id).orElseThrow(
                () -> new NotExistUserException("User not found")));
    }

    @Override
    public UserDto findUserByEmail(String email) throws NotExistUserException{
        return mapper.toDto(userRepository.findByEmail(email).orElseThrow(
                () -> new NotExistUserException("User not found")));
    }

    @Override
    public void saveUser(UserDto userDto) {
        userRepository.save(mapper.toEntity(userDto));
    }
}
