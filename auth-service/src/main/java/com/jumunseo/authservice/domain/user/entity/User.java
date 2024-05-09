package com.jumunseo.authservice.domain.user.entity;

import jakarta.persistence.*;

import static jakarta.persistence.EnumType.STRING;
import static jakarta.persistence.GenerationType.IDENTITY;

import lombok.*;
import org.hibernate.annotations.DynamicUpdate;

import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "auth_user")
@Builder
@DynamicUpdate
public class User {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    @Column(unique = true)
    private String email;

    private String password;

    private String name;

    @Enumerated(STRING)
    private Role role;

    // 로그인 타입 추가
    @Enumerated(STRING)
    private LoginType loginType;
//    // 프로필 이미지 주소 추가.
//
//    private String profileImageUrl;

    // 차단목록 추가
    @OneToMany(mappedBy = "base")
    private List<BlockUser> blockList;


}
