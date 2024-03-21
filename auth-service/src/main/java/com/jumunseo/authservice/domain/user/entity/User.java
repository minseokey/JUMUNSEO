package com.jumunseo.authservice.domain.user.entity;

import jakarta.persistence.*;

import static jakarta.persistence.EnumType.STRING;
import static jakarta.persistence.GenerationType.IDENTITY;

import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "auth_user")
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
}
