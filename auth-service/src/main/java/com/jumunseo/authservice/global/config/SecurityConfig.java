package com.jumunseo.authservice.global.config;

import com.jumunseo.authservice.domain.user.repository.UserRepository;
import com.jumunseo.authservice.global.config.CorsConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final UserRepository userRepository;
    private final CorsConfig corsConfig;

    @Bean
    public SecurityFilterChain filterChain() throws Exception {
        // 0. 전처리

        // 1. Cors 필터

        // 2. Jwt 필터

        return null;
    }
}
