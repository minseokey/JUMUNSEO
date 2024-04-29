package com.jumunseo.community.domain.post.controller;

import org.springframework.http.HttpEntity;
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

import com.jumunseo.community.domain.post.dto.PostDto;
import com.jumunseo.community.domain.post.entity.Post;
import com.jumunseo.community.domain.post.service.PostService;
import com.jumunseo.community.global.dto.Result;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/community/posts")
@RequiredArgsConstructor
public class PostController {

    private final PostService postService;

    @GetMapping("/success")
    public ResponseEntity<Result<?>> successTest() {
        log.info("[GET] test");

        try {
            postService.successTest();
            return ResponseEntity.ok().body(Result.successResult(null));
        } catch (Exception e) {
            log.error("test error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping("/error")
    public ResponseEntity<Result<?>> errorTest() {
        log.info("[GET] test");

        try {
            postService.errorTest();
            return ResponseEntity.ok().body(Result.successResult(null));
        } catch (Exception e) {
            log.error("test error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Result<?>> getPostUseID(@PathVariable Long id) {
        // TODO: id 값 검증, 데이터 검증, 서비스 호출,

        log.info("[GET] ID: {}", id);

        try {
            PostDto post = postService.getPostUseID(id);
            return ResponseEntity.ok().body(Result.successResult(post));
        } catch (Exception e) {
            log.error("getPostUseID error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }

    @PostMapping
    public ResponseEntity<Result<?>> createPost(HttpEntity<PostDto> post) {
        // TODO: 게시글 생성 DTO 생성, 데이터 검증, 에러처리, 서비스 호출

        log.info("[POST] post: {}", post);

        try {
            postService.createPost(post.getBody());
            // return ResponseEntity.ok().body(Result.successResult(post));
        } catch (Exception e) {
            log.error("createPost error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }

        return null;
    }

    @PutMapping("/{id}")
    public ResponseEntity<Result<?>> updatePost(@PathVariable String id, @ModelAttribute String entity) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        log.info("[PUT] ID: {}, entity: {}", id, entity);

        return null;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Result<?>> deletePost(@PathVariable String id) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        log.info("[DELETE] ID: {}", id);

        return null;
    }
}
