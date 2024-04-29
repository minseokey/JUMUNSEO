package com.jumunseo.community.domain.post.service;

import com.jumunseo.community.domain.post.entity.Post;

public interface PostService {
    Post getPostUseID(Long id);

    Post createPost(Post entity);

    Post updatePost(Long id, Post entity);

    void deletePost(Long id);
}
