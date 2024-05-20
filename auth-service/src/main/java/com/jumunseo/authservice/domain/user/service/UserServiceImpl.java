package com.jumunseo.authservice.domain.user.service;

import com.jumunseo.authservice.domain.jwt.exception.AccessTokenNotValidException;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import com.jumunseo.authservice.domain.user.dto.Mapper;
import com.jumunseo.authservice.domain.user.dto.SignupDto;
import com.jumunseo.authservice.domain.user.dto.UpdateDto;
import com.jumunseo.authservice.domain.user.dto.UserDto;
import com.jumunseo.authservice.domain.user.entity.BlockUser;
import com.jumunseo.authservice.domain.user.entity.LoginType;
import com.jumunseo.authservice.domain.user.entity.User;
import com.jumunseo.authservice.domain.user.exception.DuplicateEmailException;
import com.jumunseo.authservice.domain.user.exception.NotExistUserException;
import com.jumunseo.authservice.domain.user.repository.BlockUserRepository;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import com.jumunseo.authservice.global.photo.S3Uploader;
import com.jumunseo.authservice.global.util.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService, UserDetailsService {

    private final UserRepository userRepository;
    private final Mapper mapper;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;
    private final RefreshTokenService refreshTokenService;
    private final BlockUserRepository blockUserRepository;
    private final S3Uploader s3Uploader;

    @Override
    public UserDto findUserById(Long Id) throws NotExistUserException {
        return mapper.toDto(userRepository.findById(Id).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다.")));
    }

    @Override
    public UserDto findUserByEmail(String email) throws NotExistUserException {
        return mapper.toDto(userRepository.findByEmail(email).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다.")));
    }


    @Override
    public void saveUser(SignupDto signupDto) throws DuplicateEmailException {
        if (userRepository.findByEmail(signupDto.getEmail()).isPresent()) {
            throw new DuplicateEmailException("이미 존재하는 이메일입니다.");
        }
        userRepository.save(mapper.toEntity(signupDto, LoginType.LOCAL));
    }

    @Override
    public UserDto findUserByToken(String token) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("토큰이 유효하지 않습니다.");
        }
        return mapper.toDto(userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다.")));
    }

    @Override
    public List<UserDto> findUsersByIds(List<Long> userIds) {
        List<User> users = new ArrayList<>();
        for (Long userId : userIds) {
            users.add(userRepository.findById(userId).orElseThrow(
                    () -> new NotExistUserException("사용자를 찾을 수 없습니다.")));
        }
        return mapper.toDtoList(users);
    }

    @Override
    @Transactional
    public UpdateDto updateUser(String token, Map<String, String> updateInfo) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("토큰이 유효하지 않습니다.");
        }
        User originUser = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다."));

        // 더티체킹 활용
        if (updateInfo.containsKey("email")) {
            originUser.setEmail(updateInfo.get("email"));
        }
        if (updateInfo.containsKey("password")) {
            originUser.setPassword(passwordEncoder.encode(updateInfo.get("password")));
        }
        if (updateInfo.containsKey("name")) {
            originUser.setName(updateInfo.get("name"));
        }

        // 새로운 토큰 발급
        String newAccessToken = jwtTokenProvider.createAccessToken(originUser.getEmail(), String.valueOf(originUser.getRole()));
        String newRefreshToken = jwtTokenProvider.createRefreshToken();
        // 레디스에 저장된 토큰 업데이트
        refreshTokenService.updateRefreshToken(originUser.getEmail(), jwtTokenProvider.getRefreshTokenId(newRefreshToken));


        return UpdateDto.builder()
                .name(originUser.getName())
                .email(originUser.getEmail())
                .accessToken(newAccessToken)
                .refreshToken(newRefreshToken)
                .build();
    }

    @Override
    @Transactional
    public void deleteUser(String token) {
        try {
            jwtTokenProvider.validateToken(token);
        } catch (Exception e) {
            throw new AccessTokenNotValidException("토큰이 유효하지 않습니다.");
        }
        User user = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다.")
        );
        if (user.getProfileImageUrl() != null) {
            s3Uploader.delete(user.getProfileImageUrl());
        }
        userRepository.delete(user);
    }

    @Override
    // Test Method
    public void deleteUserByEmail(String email) {
        userRepository.deleteByEmail(email);
    }


    // 기존 LoadUserByUsername 재정의, 로그인 시에 사용된다.
    // 로그인 시에 사용자 정보를 가져와서 Security의 User 객체로 만들어서 반환한다.
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username).orElseThrow(
                () -> new NotExistUserException("사용자를 찾을 수 없습니다."));

        Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(user.getRole().toString()));

        return org.springframework.security.core.userdetails.User.builder()
                .username(user.getEmail())
                .password(user.getPassword())
                .authorities(authorities)
                .build();
    }

    @Override
    public boolean duplicateEmailCheck(String email) {
        return userRepository.findByEmail(email).isPresent();
    }


    @Override
    @Transactional
    public void addBlockList(String token, String blockUserId) {
        // 자신은 차단 불가.
        if (jwtTokenProvider.getEmailForAccessToken(token).equals(blockUserId)) {
            throw new NotExistUserException("자신은 차단할 수 없습니다.");
        }
        User user = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자가 없습니다."));
        User target = userRepository.findByEmail(blockUserId).orElseThrow(
                () -> new NotExistUserException("대상 사용자가 없습니다."));

        // 존재하는지 확인
        if (!blockUserRepository.existsByBaseAndTarget(user, target)) {
            throw new NotExistUserException("이미 차단한 사용자입니다.");
        }
        BlockUser blockUser = BlockUser.builder()
                .base(user)
                .target(target)
                .build();
        blockUserRepository.save(blockUser);
    }

    @Override
    @Transactional
    public void deleteBlockList(String token, String blockUserId) {
        // 자신은 차단 불가.
        if (jwtTokenProvider.getEmailForAccessToken(token).equals(blockUserId)) {
            throw new NotExistUserException("자신은 차단 헤제할 수 없습니다.");
        }
        User user = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자가 없습니다."));
        User target = userRepository.findByEmail(blockUserId).orElseThrow(
                () -> new NotExistUserException("대상 사용자가 없습니다."));

        // 존재하는지 확인
        if (!blockUserRepository.existsByBaseAndTarget(user, target)) {
            throw new NotExistUserException("차단한 사용자가 아닙니다.");
        }
        blockUserRepository.deleteByBaseAndTarget(user, target);
    }

    @Override
    public List<String> getBlockList(String token) {
        User user = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자가 없습니다."));
        List<BlockUser> blockUsers = blockUserRepository.findByBase(user);
        List<String> emails = new ArrayList<>();
        for (BlockUser blockUser : blockUsers) {
            emails.add(blockUser.getTarget().getEmail());
        }
        return emails;
    }

    @Override
    @Transactional
    public String updateProfileImage(String token, MultipartFile file) {
        User user = userRepository.findByEmail(jwtTokenProvider.getEmailForAccessToken(token)).orElseThrow(
                () -> new NotExistUserException("사용자가 없습니다."));

        // 기존 이미지 삭제, 없으면 pass
        if(user.getProfileImageUrl() != null) {
            s3Uploader.delete(user.getProfileImageUrl());
        }

        // 새로운 이미지 업로드, 없으면 pass
        if (file == null) {
            user.setProfileImageUrl(null);
            return "기본사진";
        }
        String url = s3Uploader.upload("profile", file);
        user.setProfileImageUrl(url);
        return url;
    }
}

