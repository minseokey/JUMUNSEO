package com.jumunseo.authservice.domain.user.repository;

import com.jumunseo.authservice.domain.user.entity.BlockUser;
import com.jumunseo.authservice.domain.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BlockUserRepository extends JpaRepository<BlockUser, Long> {
    List<BlockUser> findByBase(User user);
    boolean existsByBaseAndTarget(User user, User target);
    void deleteByBaseAndTarget(User user, User target);
}
