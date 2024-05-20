package com.jumunseo.community.domain.board.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
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

    @Column(name = "category_id", nullable = false)
    private String category;

    @Column(name = "user_id", length = 50, nullable = false)
    private String userId;

    @Column(name = "created_at", nullable = false)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;

    @Column(name = "view_count")
    private Long viewCount;

    @Column(name = "title")
    private String title;

    @Column(name = "content", length = 2000)
    private String content;

    @Column(name = "image_url")
    @OneToMany(mappedBy = "board")
    private List<Image> imageUrl = new ArrayList<>();

    // 카테고리에 따라 마법사, 요약의 데이터를 가진다.
    // 이걸 통해 마법사, 요약을 불러올 수 있다. (디테일 호출시만)
    private String dataId;

    @Builder
    public Board(String category, String userId,  String title, String content, List<Image> imageUrl, Long viewCount) {
        this.category = category;
        this.userId = userId;
        this.viewCount = viewCount;
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
