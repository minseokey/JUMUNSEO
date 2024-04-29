package com.jumunseo.community.domain.post.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "posts")
@Getter
@NoArgsConstructor
public class Post {
    // TODO: 이미지, 영상, 게시글 내용에 대해 리팩토링이 필요함
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "created_at")
    private Long createdAt;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Builder
    public Post(Long id, Long userId, Long createdAt, String title, String content) {
        this.id = id;
        this.userId = userId;
        this.createdAt = createdAt;
        this.title = title;
        this.content = content;
    }
}