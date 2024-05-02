package com.jumunseo.community.domain.post.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jumunseo.community.domain.post.entity.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {

    Image findByPostIdAndUrl(Long postId, String url);
}
