package com.jumunseo.community.domain.post.controller;

import java.util.List;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.http.HttpStatus;
import org.apache.tomcat.util.file.ConfigurationSource.Resource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.jumunseo.community.domain.post.dto.PostDto;
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
        // TODO: id 값 검증, 데이터 검증,

        log.info("[GET] ID: {}", id);

        try {
            return ResponseEntity.ok().body(Result.successResult(postService.getPostUseID(id)));
        } catch (Exception e) {
            log.error("getPostUseID error", e.getMessage());
            return ResponseEntity.badRequest().body(Result.failResult("Post not found"));
        }
    }

    @GetMapping("/{id}/images")
    public ResponseEntity<StreamingResponseBody> getPostImage(@PathVariable Long id,
            @RequestParam(value = "name", required = true) String imgName) throws IOException {

        return postService.getPostImage(id, imgName);
    }

    @PostMapping
    public ResponseEntity<Result<?>> createPost(@RequestPart PostDto post, @RequestPart List<MultipartFile> images) {
        // TODO: 게시글 생성 DTO 생성, 데이터 검증, 에러처리, 서비스 호출

        return ResponseEntity.ok().body(Result.successResult(postService.createPost(post, images)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Result<?>> updatePost(@PathVariable String id, HttpEntity<PostDto> post) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        log.info("[PUT] ID: {}, entity: {}", id, post);

        try {
            return ResponseEntity.ok()
                    .body(Result.successResult(postService.updatePost(Long.parseLong(id), post.getBody())));
        } catch (Exception e) {
            log.error("updatePost error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Result<?>> deletePost(@PathVariable String id) {
        // TODO: id 값 검증, 데이터 검증, 에러처리, 서비스 호출

        log.info("[DELETE] ID: {}", id);

        try {
            postService.deletePost(Long.parseLong(id));
            return ResponseEntity.ok().body(Result.successResult(null));
        } catch (Exception e) {
            log.error("deletePost error", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }
}
