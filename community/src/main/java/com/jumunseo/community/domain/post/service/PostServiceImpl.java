package com.jumunseo.community.domain.post.service;

import org.springframework.stereotype.Service;

import com.jumunseo.community.domain.post.dto.PostDto;
import com.jumunseo.community.domain.post.entity.Post;
import com.jumunseo.community.domain.post.repository.PostRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;

    @Override
    public PostDto getPostUseID(Long id) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        return PostDto.builder()
                .id(post.getId())
                .userId(post.getUserId())
                .createdAt(post.getCreatedAt())
                .title(post.getTitle())
                .content(post.getContent())
                .build();
    }

    @Override
    public PostDto createPost(PostDto postDto) {

        log.info("[Service] createPost");

        Post post = Post.builder()
                .userId(postDto.getUserId())
                .createdAt(postDto.getCreatedAt())
                .title(postDto.getTitle())
                .content(postDto.getContent())
                .build();

        postRepository.save(post);

        return PostDto.builder()
                .id(post.getId())
                .userId(post.getUserId())
                .createdAt(post.getCreatedAt())
                .title(post.getTitle())
                .content(post.getContent())
                .build();
    }

    @Override
    public PostDto updatePost(Long id, PostDto postDto) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Post updatedPost = Post.builder()
                .id(post.getId())
                .userId(postDto.getUserId())
                .createdAt(postDto.getCreatedAt())
                .title(postDto.getTitle())
                .content(postDto.getContent())
                .build();

        postRepository.save(updatedPost);

        return PostDto.builder()
                .id(updatedPost.getId())
                .userId(updatedPost.getUserId())
                .createdAt(updatedPost.getCreatedAt())
                .title(updatedPost.getTitle())
                .content(updatedPost.getContent())
                .build();
    }

    @Override
    public void deletePost(Long id) {

        postRepository.deleteById(id);
    }

    @Override
    public void successTest() {

        log.info("[Service] successTest");
    }

    @Override
    public void errorTest() {
        log.info("[Service] errorTest");
        throw new UnsupportedOperationException("Unimplemented method 'errorTest'");
    }
}
