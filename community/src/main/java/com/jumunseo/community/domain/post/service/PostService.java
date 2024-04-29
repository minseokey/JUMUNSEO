package com.jumunseo.community.domain.post.service;

import com.jumunseo.community.domain.post.dto.PostDto;

public interface PostService {

    PostDto getPostUseID(Long id);

    PostDto createPost(PostDto entity);

    PostDto updatePost(Long id, PostDto entity);

    void deletePost(Long id);

    void successTest();

    void errorTest();
}
