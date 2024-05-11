package com.jumunseo.authservice.global.photo;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.jumunseo.authservice.global.exception.LocalIOException;
import com.jumunseo.authservice.global.exception.S3IOException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@RequiredArgsConstructor
@Service
public class S3Uploader {
    private final AmazonS3 s3Client;

    @Value("${cloud.aws.s3.bucket}")
    private String bucket;

    // S3에 파일 업로드
    public String upload(String dirName, MultipartFile fileData) {
        try {
            String originalName = fileData.getOriginalFilename();
            // UUID 추가
            String uuid = UUID.randomUUID().toString();
            String uniqueName = uuid + "_" + (originalName != null ? originalName.replaceAll("\\s", "_") : null);
            String uploadPath = dirName + "/" + uniqueName;

            // MultipartFile -> File 변환
            File uploadFile = convert(fileData);
            
            // S3에 파일 업로드
            String uploadImageUrl = putS3(uploadFile, uploadPath);
            // 로컬에 생성된 파일 삭제
            if(!uploadFile.delete()){
                throw new LocalIOException("로컬 파일 삭제에 실패하였습니다.");
            }
            return uploadImageUrl;
        } catch (Exception e) {
            throw new S3IOException("S3 파일 업로드에 실패하였습니다.");
        }
    }

    // S3에 올라간 파일 삭제
    public void delete(String fileName) {
        try{
            String decodedFileName = URLDecoder.decode(fileName, StandardCharsets.UTF_8);
            s3Client.deleteObject(bucket, decodedFileName);
        }
        catch (Exception e){
            throw new S3IOException("S3 파일 삭제에 실패하였습니다.");
        }
    }

    // S3에 파일 업로드
    public String putS3(File uploadFile, String fileName) {
        s3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile)
                .withCannedAcl(CannedAccessControlList.PublicRead));
        return s3Client.getUrl(bucket, fileName).toString();
    }

    // MultipartFile을 File로 변환
    public File convert(MultipartFile file) {
        String originalName = file.getOriginalFilename();
        String uniqueName = UUID.randomUUID() + "_" + (originalName != null ? originalName.replaceAll("\\s", "_") : null);

        File convertFile = new File(uniqueName);
        try {
            if (!convertFile.createNewFile()) {
                throw new LocalIOException("로컬 파일 생성에 실패하였습니다.");
            }
            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
                fos.write(file.getBytes());
            } catch (Exception e) {
                // 파일 쓰기 도중 예외 발생 시 파일 삭제 후 예외를 다시 던집니다.
                convertFile.delete();
                throw new LocalIOException("로컬 파일 생성에 실패하였습니다.");
            }
        } catch (Exception e) {
            throw new LocalIOException("로컬 파일 생성에 실패하였습니다.");
        }

        return convertFile;
    }

}
