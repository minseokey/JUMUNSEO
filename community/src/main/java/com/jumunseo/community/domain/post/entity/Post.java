package com.jumunseo.community.domain.post.entity;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "posts")
@Getter
@NoArgsConstructor
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "category_id", nullable = false)
    @Enumerated
    private CategoryType categoryId;

    @Column(name = "user_id", length = 50, nullable = false)
    private String userId;

    @Column(name = "created_at", nullable = false)
    private Date createdAt;

    @Column(name = "updated_at")
    private Date updatedAt;

    @Column(name = "deleted_at")
    private Date deletedAt;

    @Column(name = "view_count")
    private Long viewCount;

    @Column(name = "title")
    private String title;

    @Column(name = "content", length = 2000)
    private String content;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
    private List<Image> images;

    @Builder
    public Post(Long id, CategoryType categoryId, String userId, Date createdAt, Date updatedAt, Date deletedAt,
            Long viewCount, String title, String content, List<Image> images) {
        this.id = id;
        this.categoryId = categoryId;
        this.userId = userId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.deletedAt = deletedAt;
        this.viewCount = viewCount;
        this.title = title;
        this.content = content;
        this.images = images;
    }
}