package com.jumunseo.community.domain.post.service;

import org.springframework.stereotype.Service;

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
    public Post getPostUseID(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getPostUseID'");
    }

    @Override
    public Post createPost(Post entity) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'createPost'");
    }

    @Override
    public Post updatePost(Long id, Post entity) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'updatePost'");
    }

    @Override
    public void deletePost(Long id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deletePost'");
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
