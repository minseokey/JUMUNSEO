package com.jumunseo.community.domain.post.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jumunseo.community.domain.post.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {

}
