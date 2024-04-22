package com.jumunseo.community.domain.post.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/community/posts")
public class PostController {
    @GetMapping("/{id}")
    public ResponseEntity getPostUseID(@PathVariable Long id) {
        // TODO: id 값 검증, 데이터 검증, 서비스 호출,

        return null;
    }

    @PostMapping
    public ResponseEntity createPost(@ModelAttribute String entity) {
        // TODO: 게시글 생성 DTO 생성, 데이터 검증, 에러처리, 서비스 호출

        return null;
    }

    @PutMapping("/{id}")
    public ResponseEntity updatePost(@PathVariable String id, @ModelAttribute String entity) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        return null;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletePost(@PathVariable String id) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        return null;
    }
}
