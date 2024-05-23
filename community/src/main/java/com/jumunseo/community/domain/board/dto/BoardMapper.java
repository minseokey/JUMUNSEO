package com.jumunseo.community.domain.board.dto;

import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.board.entity.Image;
import com.jumunseo.community.domain.board.repository.BoardRepository;
import com.jumunseo.community.domain.board.repository.ImageRepository;
import com.jumunseo.community.domain.board.repository.LikeRepository;
import com.jumunseo.community.domain.comment.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardMapper {

    private final ImageRepository imageRepository;
    private final BoardRepository boardRepository;
    private final LikeRepository likeRepository;
    private final CommentRepository commentRepository;

    public BoardResponseDto entityToBoardResponse(Board board) {
        return BoardResponseDto.builder()
                .id(board.getId())
                .category(board.getCategory())
                .userId(board.getUserId())
                .title(board.getTitle())
                .content(board.getContent())
                .imageUrl(imageToUrl(board.getImageUrl()))
                .viewCount(board.getViewCount())
                .likeCount(likeRepository.countByBoardId(board.getId()))
                .commentCount(commentRepository.countByBoard(board))
                .createdAt(board.getCreatedAt())
                .updatedAt(board.getUpdatedAt())
                .id(board.getId())
                .dataId(board.getDataId())
                .build();
    }
    public Board requestToEntity(BoardRequestDto boardDTO) {
        return Board.builder()
                .category(boardDTO.getCategory())
                .userId(boardDTO.getUserId())
                .title(boardDTO.getTitle())
                .content(boardDTO.getContent())
                .viewCount(0L)
                .build();
    }

    public List<String> imageToUrl(List<Image> images) {
        return images.stream()
                .map(Image::getPath)
                .toList();
    }

    public BoardListResponseDto entityToBoardListResponse(Board board) {
        return BoardListResponseDto.builder()
                .id(board.getId())
                .title(board.getTitle())
                .content(board.getContent())
                .viewCount(board.getViewCount())
                .category(board.getCategory())
                .userId(board.getUserId())
                .createdAt(board.getCreatedAt())
                .build();
    }

    public BoardListPhotoResponseDto entityToBoardListPhotoResponse(Board board) {
        return BoardListPhotoResponseDto.builder()
                .id(board.getId())
                .title(board.getTitle())
                .content(board.getContent())
                .viewCount(board.getViewCount())
                .category(board.getCategory())
                .userId(board.getUserId())
                .createdAt(board.getCreatedAt())
                .imageUrl(imageToUrl(board.getImageUrl()))
                .build();
    }

}
