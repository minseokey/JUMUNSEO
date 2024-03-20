package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.user.dto.Mapper;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.domain.user.entity.User;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService, UserDetailsService{

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


    // 기존 LoadUserByUsername 재정의, 로그인 시에 사용된다.
    // 로그인 시에 사용자 정보를 가져와서 Security의 User 객체로 만들어서 반환한다.
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username).orElseThrow(
                () -> new NotExistUserException("User not found"));

        SimpleGrantedAuthority authority = new SimpleGrantedAuthority(user.getRole().toString());

        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getEmail())
                .password(user.getPassword())
                .authorities(authority)
                .build();
    }
}
