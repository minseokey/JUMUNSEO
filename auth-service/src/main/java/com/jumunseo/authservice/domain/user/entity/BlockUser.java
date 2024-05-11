package com.jumunseo.authservice.domain.user.entity;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class BlockUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "base_user")
    private User base;

    @ManyToOne
    @JoinColumn(name = "target_user")
    private User target;

    @Builder
    public BlockUser(User base, User target){
        this.base = base;
        this.target = target;
    }
}
