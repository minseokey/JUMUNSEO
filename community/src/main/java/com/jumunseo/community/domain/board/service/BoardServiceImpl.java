package com.jumunseo.community.domain.board.service;

import com.jumunseo.community.domain.board.dto.BoardListResponseDto;
import com.jumunseo.community.domain.board.dto.BoardMapper;
import com.jumunseo.community.domain.board.dto.BoardRequestDto;
import com.jumunseo.community.domain.board.dto.BoardResponseDto;
import com.jumunseo.community.domain.board.entity.Board;
import com.jumunseo.community.domain.board.entity.CATEGORY;
import com.jumunseo.community.domain.board.entity.Image;
import com.jumunseo.community.domain.board.entity.LikeBoard;
import com.jumunseo.community.domain.board.exceptions.NoBoardException;
import com.jumunseo.community.domain.board.repository.BoardRepository;
import com.jumunseo.community.domain.board.repository.ImageRepository;
import com.jumunseo.community.domain.board.repository.LikeRepository;
import com.jumunseo.community.global.util.S3Uploader;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper mapper;
    private final BoardRepository boardRepository;
    private final LikeRepository likeRepository;
    private final ImageRepository imageRepository;
    private final S3Uploader s3Uploader;

    @Override
    @Transactional
    public void registerBoard(BoardRequestDto boardDTO) {
        Board board = mapper.requestToEntity(boardDTO);

        if(boardDTO.getCategory() == CATEGORY.SUMMARY || boardDTO.getCategory() == CATEGORY.MAGICIAN){
            board.setDataId(boardDTO.getDataId());
        }
        else {
            board.setDataId(-1L);
        }

        boardRepository.save(board);
        List<String> imageUrls = boardDTO.getImageUrl();
        for(String imageUrl : imageUrls) {
            imageRepository.save(Image.builder().path(imageUrl).board(board).build());
        }
    }

    @Override
    @Transactional
    public void modifyBoard(BoardRequestDto boardDTO, Long boardId) {
        Board board = boardRepository.findById(boardId).orElseThrow((
        ) -> new NoBoardException("해당 게시글이 존재하지 않습니다."));

        if(boardDTO.getCategory() != null)
            board.setCategory(boardDTO.getCategory());
        if(boardDTO.getTitle() != null)
            board.setTitle(boardDTO.getTitle());
        if(boardDTO.getContent() != null)
            board.setContent(boardDTO.getContent());
        if (boardDTO.getImageUrl() != null) {
            // 기존 이미지 삭제
            for(Image image : board.getImageUrl()) {
                s3Uploader.delete(image.getPath());
            }
            imageRepository.deleteAll(board.getImageUrl());
            // 새로운 이미지 등록
            List<String> imageUrls = boardDTO.getImageUrl();
            for(String imageUrl : imageUrls) {
                imageRepository.save(Image.builder().path(imageUrl).board(board).build());
            }
        }
        // 업데이트 시간 설정
        board.setUpdatedAt(LocalDateTime.now());
    }

    @Override
    @Transactional
    public void removeBoard(Long boardId) {
        Board board = boardRepository.findById(boardId).orElseThrow((
        ) -> new NoBoardException("해당 게시글이 존재하지 않습니다."));
        for(Image image : board.getImageUrl()) {
            s3Uploader.delete(image.getPath());
        }
        imageRepository.deleteAll(board.getImageUrl()); // 게시글에 달린 이미지 삭제
        boardRepository.delete(board); // 게시글 삭제
    }

    @Override
    @Transactional
    public BoardResponseDto getBoard(Long boardId, String userId) {
        Board board = boardRepository.findById(boardId).orElseThrow((
        ) -> new NoBoardException("해당 게시글이 존재하지 않습니다."));
        board.addViewCount();

        BoardResponseDto boardResponseDto = mapper.entityToBoardResponse(board);
        boardResponseDto.setMy_Like(likeRepository.findByBoardAndUserId(board, userId).isPresent());
        return mapper.entityToBoardResponse(board); // 게시글 조회
    }

    @Override
    public List<BoardListResponseDto> getBoardListByLatestAndCategory(Long index, CATEGORY category) {
        List<Board> boards = boardRepository.findAllByCategoryAndIndex(index, category);
        List<BoardListResponseDto> boardResponseDtos = new ArrayList<>();
        for(Board board : boards) {
            boardResponseDtos.add(mapper.entityToBoardListResponse(board));
        }
        return boardResponseDtos;
    }


    @Override
    public List<BoardListResponseDto> getBoardListByLatest(Long index) {
        List<Board> boards = boardRepository.findAllByIndex(index);
        List<BoardListResponseDto> boardResponseDtos = new ArrayList<>();
        for(Board board : boards) {
            boardResponseDtos.add(mapper.entityToBoardListResponse(board));
        }
        return boardResponseDtos;
    }

    @Override
    @Transactional
    public void Like(Long boardId, String userId) {
        Board board = boardRepository.findById(boardId).orElseThrow((
        ) -> new NoBoardException("해당 게시글이 존재하지 않습니다."));

        if(likeRepository.findByBoardAndUserId(board, userId).isPresent()) {
            LikeBoard like = likeRepository.findByBoardAndUserId(board, userId).get();
            likeRepository.delete(like);
        } else {
            LikeBoard like = LikeBoard.builder()
                    .board(board)
                    .userId(userId)
                    .build();
            likeRepository.save(like);
        }
    }
}
