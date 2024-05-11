package com.jumunseo.authservice.global.security;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jumunseo.authservice.global.dto.Result;
import com.jumunseo.authservice.global.exception.CredInfoNonCorrectException;
import com.jumunseo.authservice.global.exception.CustomException;
import com.jumunseo.authservice.global.exception.SimpleIOException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@RequiredArgsConstructor
public class ExceptionHandlerFilter extends OncePerRequestFilter {

    private final ObjectMapper objectMapper;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        try {
            filterChain.doFilter(request, response);
        }catch (CustomException e) {
            setErrorResponse(response, e.getResult().getMessage(), e.getHttpStatus().value());
        }catch (Exception e) {
            setErrorResponse(response, e.getMessage(), HttpStatus.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void setErrorResponse(HttpServletResponse response, String message, int status) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(objectMapper.writeValueAsString(Result.failResult(message)));
    }
}
