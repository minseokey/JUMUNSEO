package com.jumunseo.community.domain.post.service;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.jumunseo.community.domain.post.dto.CommentDto;
import com.jumunseo.community.domain.post.dto.PostDto;
import com.jumunseo.community.domain.post.dto.RecommendationDto;
import com.jumunseo.community.domain.post.dto.UserDto;

public interface PostService {

    PostDto getPostUseID(Long id);

    Slice<PostDto> getPosts(Pageable page, int size);

    ResponseEntity<StreamingResponseBody> getPostImage(Long id, String imgName);

    PostDto createPost(PostDto post, List<MultipartFile> images);

    CommentDto createComment(Long postId, CommentDto comment);

    RecommendationDto createGoodRecommend(Long postId, UserDto user);

    RecommendationDto createBadRecommend(Long postId, UserDto user);

    PostDto updatePost(Long id, PostDto entity);

    CommentDto updateComment(Long id, CommentDto entity);

    void deletePost(Long id);

    void deleteComment(Long id);

    void successTest();

    void errorTest();
}
