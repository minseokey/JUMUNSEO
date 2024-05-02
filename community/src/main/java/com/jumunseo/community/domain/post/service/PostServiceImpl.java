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
import com.jumunseo.community.global.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final ImageRepository imageRepository;

    private final FileUtil fileUtil;

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
    public PostDto createPost(PostDto postDto, List<MultipartFile> imageFiles) {

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
        postRepository.save(post);

        fileUtil.setPath(fileUtil.getPath() + "/src/main/resources/static/images/");

        log.info("[Service] createPost\n{}", postDto.toString());

        for (MultipartFile imageFile : imageFiles) {
            String fileName = imageFile.getOriginalFilename();
            if (fileName == null)
                continue;

            String fileType = fileUtil.getFileType(fileName);
            if (!fileUtil.isImage(fileType))
                continue;

            String saveFileName = fileUtil.getRandomFileName(fileName);
            try {
                imageFile.transferTo(new File(fileUtil.getFilePath(saveFileName)));
            } catch (Exception e) {
                log.error("[Service] createPost {}", e.getMessage());
            }

            Image image = Image.builder()
                    .post(post)
                    .url(fileUtil.getFilePath(saveFileName))
                    .build();

            imageRepository.save(image);
        }

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
