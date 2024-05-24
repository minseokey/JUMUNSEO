package com.jumunseo.community.domain.board.repository;

import com.jumunseo.community.domain.board.entity.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageRepository extends JpaRepository<Image,Long>{
}
