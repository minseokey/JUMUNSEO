package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.jwt.exception.AccessTokenNotValidException;
import com.jumunseo.authservice.domain.user.dto.Mapper;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.domain.user.entity.User;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService, UserDetailsService{

    private final UserRepository userRepository;
    private final Mapper mapper;
    private final JwtTokenProvider jwtTokenProvider;

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
    public void saveUser(SignupDto signupDto) {
        userRepository.save(mapper.toEntity(signupDto));
    }

    @Override
    public UserDto findUserByToken(String token) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("not valid token");
        }
        return mapper.toDto(userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("User not found")));
    }

    @Override
    public List<UserDto> findUsersByIds(List<Long> userIds) {
        List<User> users = new ArrayList<>();
        for(Long userId : userIds) {
            users.add(userRepository.findById(userId).orElseThrow(
                    () -> new NotExistUserException("User not found")));
        }
        return mapper.toDtoList(users);
    }

    @Override
    public void updateUser(String token, SignupDto signupDto) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("not valid token");
        }
        User newuser = mapper.toEntity(signupDto);
        User originUser = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("User not found"));

        // 더티체킹 활용
        originUser.setEmail(newuser.getEmail());
        originUser.setPassword(newuser.getPassword());
        originUser.setRole(newuser.getRole());
        userRepository.save(originUser);

    }

    @Override
    public void deleteUser(String token) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("not valid token");
        }
        userRepository.deleteByEmail(jwtTokenProvider.getEmailForAccessToken(token));
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
