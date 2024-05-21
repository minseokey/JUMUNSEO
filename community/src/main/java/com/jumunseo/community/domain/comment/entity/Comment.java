package com.jumunseo.community.domain.comment.entity;

import com.jumunseo.community.domain.board.entity.Board;
import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userId;
    private String content;

    @ManyToOne
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Board board;
    private Long headCommentId;

    @Builder
    public Comment(String userId, String content, Board board, Long headCommentId) {
        this.userId = userId;
        this.content = content;
        this.board = board;
        this.headCommentId = headCommentId;
    }
}
