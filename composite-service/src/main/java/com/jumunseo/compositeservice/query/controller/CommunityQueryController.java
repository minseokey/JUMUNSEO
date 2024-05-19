package com.jumunseo.compositeservice.query.controller;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/query/community")
@Tag(name = "Communinty Query", description = "커뮤니티 서비스를 위한 쿼리 컨트롤러")
public class CommunityQueryController {
}
