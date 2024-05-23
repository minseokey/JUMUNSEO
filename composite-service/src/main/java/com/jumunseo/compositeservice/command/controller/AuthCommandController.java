package com.jumunseo.compositeservice.command.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/command/auth")
@Tag(name = "Auth Command", description = "인증 서비스를 위한 커맨드 컨트롤러")
public class AuthCommandController {
}
