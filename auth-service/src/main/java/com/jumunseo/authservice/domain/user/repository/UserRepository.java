package com.jumunseo.authservice.domain.user.repository;

import com.jumunseo.authservice.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    void updateByEmail(String email, User user);
    void deleteByEmail(String Email);
}
