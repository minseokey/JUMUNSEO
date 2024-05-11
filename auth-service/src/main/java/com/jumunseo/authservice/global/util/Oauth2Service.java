package com.jumunseo.authservice.global.util;

import com.jumunseo.authservice.domain.user.dto.OAuthAttributeDto;
import com.jumunseo.authservice.domain.user.entity.User;
import com.jumunseo.authservice.domain.jwt.service.RefreshTokenService;
import com.jumunseo.authservice.domain.user.repository.UserRepository;
import com.jumunseo.authservice.domain.user.service.UserServiceImpl;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseCookie;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collection;


@RequiredArgsConstructor
@Service
public class Oauth2Service implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    private final UserServiceImpl userService;
    private final UserRepository userRepository;
    private final JwtTokenProvider jwtTokenProvider;
    private final RefreshTokenService refreshTokenService;
    private final CookieProvider cookieProvider;
    @Override
    @Transactional
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        // OAuth 서비스 종류
        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        // OAuth 로그인시 키가 되는 필드값
        String userNameAttributeName = userRequest.getClientRegistration()
                .getProviderDetails()
                .getUserInfoEndpoint()
                .getUserNameAttributeName();

        OAuthAttributeDto authAttributeDto = OAuthAttributeDto.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());
        User user = saveUser(authAttributeDto);

        String email = user.getEmail();
        Collection<? extends GrantedAuthority> authorities = userService.loadUserByUsername(email).getAuthorities();

        return new DefaultOAuth2User(authorities, authAttributeDto.getAttributes(), userNameAttributeName);
    }


    private User saveUser(OAuthAttributeDto authDto){
        return userRepository.save(userRepository.findByEmail(authDto.getEmail())
                .orElse(authDto.toEntity(authDto)));
    }

    public void oauth2SuccessHandler(HttpServletRequest request,
                                     HttpServletResponse response,
                                     Authentication authentication) throws IOException {

        // 리프레시 토큰 생성
        String email = String.valueOf(((DefaultOAuth2User)authentication.getPrincipal()).getAttributes().get("email"));
        String refreshToken = jwtTokenProvider.createRefreshToken();
        refreshTokenService.updateRefreshToken(email, jwtTokenProvider.getRefreshTokenId(refreshToken));

        // 쿠키 달기
        ResponseCookie responseCookie = cookieProvider.createRefreshTokenCookie(refreshToken);
        Cookie cookie = cookieProvider.of(responseCookie);
        response.addCookie(cookie);
        response.setContentType("application/json");

        // 바디 만들기
        String role = authentication.getAuthorities().stream().findFirst().get().getAuthority();
        System.out.println(role + email);
        String accessToken = jwtTokenProvider.createAccessToken(email, role);
        response.addHeader("Authorization",accessToken);
        // 리다이렉트
        response.sendRedirect("http://localhost:8080/login/oauth2/success?accessToken="+accessToken);
    }

    public void oauth2FailureHandler(HttpServletRequest request,
                                     HttpServletResponse response,
                                     AuthenticationException exception) throws IOException {
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);

        response.sendRedirect("http://localhost:8080/login");

    }


}
