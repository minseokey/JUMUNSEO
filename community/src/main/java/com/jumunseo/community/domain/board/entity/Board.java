package com.jumunseo.community.domain.board.entity;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "board")
@Getter
@Setter
@NoArgsConstructor
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(value = EnumType.STRING)
    @Column(name = "category_id", nullable = false)
    private CATEGORY category;

    @Column(name = "user_id", length = 50, nullable = false)
    private String userId;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(name = "view_count")
    @ColumnDefault("0")
    private Long viewCount;

    @Column(name = "title")
    private String title;

    @Column(name = "content", length = 2000)
    private String content;

    @Column(name = "image_url")
    @OneToMany(mappedBy = "board")
    private List<Image> imageUrl = new ArrayList<>();

    @Builder
    public Board(CATEGORY category, String userId,  String title, String content, List<Image> imageUrl) {
        this.category = category;
        this.userId = userId;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now(); // 생성시에는 현재시간
        this.title = title;
        this.content = content;
        this.imageUrl = imageUrl;
    }

    public void addViewCount() {
        this.viewCount++;
    }
}
