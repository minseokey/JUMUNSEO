package com.jumunseo.authservice.domain.user.repository;

import com.jumunseo.authservice.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
