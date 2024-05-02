package com.jumunseo.community.domain.post.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jumunseo.community.domain.post.dto.PostDto;
import com.jumunseo.community.domain.post.entity.Image;
import com.jumunseo.community.domain.post.entity.Post;
import com.jumunseo.community.domain.post.repository.ImageRepository;
import com.jumunseo.community.domain.post.repository.PostRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final ImageRepository imageRepository;

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
    public PostDto createPost(PostDto postDto, List<MultipartFile> images) {
        String pwd = System.getenv("PWD");
        String path = pwd + "/src/main/resources/static/images/";

        log.info("[Service] createPost\n{}", postDto.toString());

        for (MultipartFile image : images) {
            String fileName = image.getOriginalFilename();
            if (fileName == null)
                continue;
            String[] split = fileName.split("\\.");
            String ext = split[split.length - 1];
            String[] allowedExt = { "jpg", "jpeg", "png", "gif" };
            boolean isAllowed = false;
            for (String s : allowedExt) {
                if (s.equals(ext)) {
                    isAllowed = true;
                    break;
                }
            }
            if (!isAllowed)
                continue;
            String uuid = UUID.randomUUID().toString();
            String saveFileName = uuid + "." + ext;
            try {
                image.transferTo(new File(path + saveFileName));
            } catch (Exception e) {
                log.error("[Service] createPost {}", e.getMessage());
            }
        }

        Post post = Post.builder()
                .categoryType(postDto.getCategoryType())
                .userId(postDto.getUserId())
                .createdAt(postDto.getCreatedAt())
                .updatedAt(null)
                .deletedAt(null)
                .viewCount(0L)
                .title(postDto.getTitle())
                .content(postDto.getContent())
                .images(null)
                .build();

        Image image = Image.builder()
                .post(post)
                .url(path)
                .build();

        postRepository.save(post);
        imageRepository.save(image);

        return postDto;

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
