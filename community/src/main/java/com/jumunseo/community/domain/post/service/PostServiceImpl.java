package com.jumunseo.community.domain.post.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.util.List;
import java.sql.Date;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.jumunseo.community.domain.post.dto.CommentDto;
import com.jumunseo.community.domain.post.dto.PostDto;
import com.jumunseo.community.domain.post.dto.RecommendationDto;
import com.jumunseo.community.domain.post.dto.UserDto;
import com.jumunseo.community.domain.post.entity.Comment;
import com.jumunseo.community.domain.post.entity.Image;
import com.jumunseo.community.domain.post.entity.Post;
import com.jumunseo.community.domain.post.entity.Recommendation;
import com.jumunseo.community.domain.post.entity.RecommendationType;
import com.jumunseo.community.domain.post.repository.CommentRepository;
import com.jumunseo.community.domain.post.repository.ImageRepository;
import com.jumunseo.community.domain.post.repository.PostRepository;
import com.jumunseo.community.domain.post.repository.RecommendationRepository;
import com.jumunseo.community.global.util.FileUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final ImageRepository imageRepository;
    private final CommentRepository commentRepository;
    private final RecommendationRepository recommendationRepository;

    private final FileUtil fileUtil;

    @Override
    public PostDto getPostUseID(Long id) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        return PostDto.builder()
                .id(post.getId())
                .userId(post.getUserId())
                .createdAt(post.getCreatedAt())
                .title(post.getTitle())
                .content(post.getContent())
                .build();
    }

    @Override
    public Slice<PostDto> getPosts(Pageable page, int size) {

        Slice<Post> posts = postRepository.findAll(page);

        return posts.map(post -> PostDto.builder()
                .id(post.getId())
                .userId(post.getUserId())
                .createdAt(post.getCreatedAt())
                .title(post.getTitle())
                .content(post.getContent())
                .build());
    }

    @Override
    public ResponseEntity<StreamingResponseBody> getPostImage(Long id, String imgName) {

        Image image = imageRepository.findByPostIdAndUrl(id, imgName);
        log.info(image.getUrl());
        if (image == null)
            throw new IllegalArgumentException("Image not found");

        try {
            FileInputStream inputStream = new FileInputStream(fileUtil.getFilePath(image.getUrl()));
            StreamingResponseBody responseBody = new StreamingResponseBody() {
                @Override
                public void writeTo(OutputStream outputStream) throws IOException {
                    byte[] buffer = new byte[1024];
                    int length;
                    while ((length = inputStream.read(buffer)) >= 0) {
                        outputStream.write(buffer, 0, length);
                    }
                    inputStream.close();
                }
            };

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Type", "image/" + fileUtil.getFileType(image.getUrl()));
            headers.add("Content-Length", String.valueOf(fileUtil.getFile(image.getUrl()).length));

            return ResponseEntity.ok().headers(headers).body(responseBody);
        } catch (Exception e) {
            log.error("[Service] getPostImage {}", e.getMessage());
            return ResponseEntity.badRequest().body(null);
        }
    }

    @Override
    public PostDto createPost(PostDto postDto, List<MultipartFile> imageFiles) {

        Post post = Post.builder()
                .categoryType(postDto.getCategoryType())
                .userId(postDto.getUserId())
                .createdAt(new Date(System.currentTimeMillis()))
                .viewCount(0L)
                .title(postDto.getTitle())
                .content(postDto.getContent())
                .build();
        postRepository.save(post);

        // fileUtil.setPath(fileUtil.getPath() + "/src/main/resources/static/images/");

        log.info("[Service] createPost\n{}", postDto.toString());

        for (MultipartFile imageFile : imageFiles) {
            String fileName = imageFile.getOriginalFilename();
            if (fileName == null)
                continue;

            String fileType = fileUtil.getFileType(fileName);
            if (!fileUtil.isImage(fileType))
                continue;

            String saveFileName = fileUtil.getRandomFileName(fileName);
            try {
                imageFile.transferTo(new File(fileUtil.getFilePath(saveFileName)));
            } catch (Exception e) {
                log.error("[Service] createPost {}", e.getMessage());
            }

            Image image = Image.builder()
                    .post(post)
                    .url(saveFileName)
                    .build();

            imageRepository.save(image);
        }

        return postDto;

    }

    @Override
    public CommentDto createComment(Long id, CommentDto commentDto) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Comment comment = Comment.builder()
                .post(post)
                .userId(commentDto.getUserId())
                .content(commentDto.getContent())
                .createdAt(new Date(System.currentTimeMillis()))
                .build();

        commentRepository.save(comment);

        return CommentDto.builder()
                .id(comment.getId())
                .userId(comment.getUserId())
                .post(comment.getPost().getId())
                .content(comment.getContent())
                .createdAt(comment.getCreatedAt())
                .updatedAt(null)
                .build();

    }

    @Override
    public RecommendationDto createGoodRecommend(Long id, UserDto userDto) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Recommendation recommendation = recommendationRepository.findByUserIdAndPostId(userDto.getUserId(), id);
        if (recommendation == null) {
            Recommendation goodRecommendation = Recommendation.builder()
                    .post(post)
                    .userId(userDto.getUserId())
                    .recommendationType(RecommendationType.GOOD)
                    .createdAt(new Date(System.currentTimeMillis()))
                    .build();
            recommendationRepository.save(goodRecommendation);

            return RecommendationDto.builder()
                    .id(goodRecommendation.getId())
                    .post(goodRecommendation.getPost())
                    .userId(goodRecommendation.getUserId())
                    .isRecommend(goodRecommendation.getRecommendationType())
                    .createdAt(goodRecommendation.getCreatedAt())
                    .deletedAt(goodRecommendation.getDeletedAt())
                    .build();
        }

        if (recommendation.getRecommendationType() == RecommendationType.BAD) {
            Recommendation goodRecommendation = Recommendation.builder()
                    .id(recommendation.getId())
                    .post(post)
                    .userId(userDto.getUserId())
                    .recommendationType(RecommendationType.GOOD)
                    .createdAt(new Date(System.currentTimeMillis()))
                    .build();
            recommendationRepository.save(goodRecommendation);
        }

        return RecommendationDto.builder()
                .id(recommendation.getId())
                .post(recommendation.getPost())
                .userId(recommendation.getUserId())
                .isRecommend(recommendation.getRecommendationType())
                .createdAt(recommendation.getCreatedAt())
                .deletedAt(recommendation.getDeletedAt())
                .build();
    }

    @Override
    public RecommendationDto createBadRecommend(Long id, UserDto userDto) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Recommendation recommendation = recommendationRepository.findByUserIdAndPostId(userDto.getUserId(), id);
        if (recommendation == null) {
            Recommendation badRecommendation = Recommendation.builder()
                    .post(post)
                    .userId(userDto.getUserId())
                    .recommendationType(RecommendationType.BAD)
                    .createdAt(new Date(System.currentTimeMillis()))
                    .build();
            recommendationRepository.save(badRecommendation);

            return RecommendationDto.builder()
                    .id(badRecommendation.getId())
                    .post(badRecommendation.getPost())
                    .userId(badRecommendation.getUserId())
                    .isRecommend(badRecommendation.getRecommendationType())
                    .createdAt(badRecommendation.getCreatedAt())
                    .deletedAt(badRecommendation.getDeletedAt())
                    .build();
        }

        if (recommendation.getRecommendationType() == RecommendationType.GOOD) {
            Recommendation badRecommendation = Recommendation.builder()
                    .id(recommendation.getId())
                    .post(post)
                    .userId(userDto.getUserId())
                    .recommendationType(RecommendationType.BAD)
                    .createdAt(new Date(System.currentTimeMillis()))
                    .build();
            recommendationRepository.save(badRecommendation);
        }

        return RecommendationDto.builder()
                .id(recommendation.getId())
                .post(recommendation.getPost())
                .userId(recommendation.getUserId())
                .isRecommend(recommendation.getRecommendationType())
                .createdAt(recommendation.getCreatedAt())
                .deletedAt(recommendation.getDeletedAt())
                .build();
    }

    @Override
    public PostDto updatePost(Long id, PostDto postDto) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Post updatedPost = Post.builder()
                .id(post.getId())
                .userId(postDto.getUserId())
                .createdAt(postDto.getCreatedAt())
                .updatedAt(new Date(System.currentTimeMillis()))
                .title(postDto.getTitle())
                .content(postDto.getContent())
                .build();

        postRepository.save(updatedPost);

        return PostDto.builder()
                .id(updatedPost.getId())
                .userId(updatedPost.getUserId())
                .createdAt(updatedPost.getCreatedAt())
                .updatedAt(updatedPost.getUpdatedAt())
                .title(updatedPost.getTitle())
                .content(updatedPost.getContent())
                .build();
    }

    @Override
    public CommentDto updateComment(Long id, CommentDto commentDto) {

        Comment comment = commentRepository.findById(id).orElse(null);
        if (comment == null)
            throw new IllegalArgumentException("Comment not found");

        Comment updatedComment = Comment.builder()
                .id(comment.getId())
                .userId(commentDto.getUserId())
                .post(comment.getPost())
                .content(commentDto.getContent())
                .createdAt(commentDto.getCreatedAt())
                .updatedAt(new Date(System.currentTimeMillis()))
                .build();

        commentRepository.save(updatedComment);

        return CommentDto.builder()
                .id(updatedComment.getId())
                .userId(updatedComment.getUserId())
                .post(updatedComment.getPost().getId())
                .content(updatedComment.getContent())
                .createdAt(updatedComment.getCreatedAt())
                .updatedAt(updatedComment.getUpdatedAt())
                .build();
    }

    @Override
    public void deletePost(Long id) {

        Post post = postRepository.findById(id).orElse(null);
        if (post == null)
            throw new IllegalArgumentException("Post not found");

        Post updatedPost = Post.builder()
                .id(post.getId())
                .userId(post.getUserId())
                .createdAt(post.getCreatedAt())
                .title(post.getTitle())
                .content(post.getContent())
                .viewCount(post.getViewCount())
                .deletedAt(new Date(System.currentTimeMillis()))
                .categoryType(post.getCategoryType())
                .build();

        postRepository.save(updatedPost);
    }

    @Override
    public void deleteComment(Long id) {

        Comment comment = commentRepository.findById(id).orElse(null);
        if (comment == null)
            throw new IllegalArgumentException("Comment not found");

        Comment updatedComment = Comment.builder()
                .id(comment.getId())
                .userId(comment.getUserId())
                .post(comment.getPost())
                .content(comment.getContent())
                .createdAt(comment.getCreatedAt())
                .updatedAt(comment.getUpdatedAt())
                .deletedAt(new Date(System.currentTimeMillis()))
                .build();

        commentRepository.save(updatedComment);
    }

    @Override
    public void successTest() {

        log.info("[Service] successTest");
    }

    @Override
    public void errorTest() {
        log.info("[Service] errorTest");
        throw new UnsupportedOperationException("Unimplemented method 'errorTest'");
    }
}
