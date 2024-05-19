package com.jumunseo.compositeservice.command.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/command/community")
@Tag(name = "Community Command", description = "커뮤니티 서비스를 위한 커맨드 컨트롤러")
public class CommunityCommandController {
}
