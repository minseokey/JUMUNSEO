package com.jumunseo.community.global.util;

import java.util.UUID;

import org.springframework.stereotype.Component;

@Component
public class FileUtil {
    private final String[] imageTypes = { "jpg", "jpeg", "png", "gif" };
    private final String[] videoTypes = { "mp4", "avi", "mov", "wmv" };
    private final String[] audioTypes = { "mp3", "wav", "flac", "ogg" };
    private final String[] documentTypes = { "pdf", "doc", "docx", "ppt", "pptx", "xls", "xlsx" };
    private String path = System.getenv("PWD");

    public boolean isImage(String type) {
        for (String imageType : imageTypes) {
            if (imageType.equals(type)) {
                return true;
            }
        }
        return false;
    }

    public boolean isVideo(String type) {
        for (String videoType : videoTypes) {
            if (videoType.equals(type)) {
                return true;
            }
        }
        return false;
    }

    public boolean isAudio(String type) {
        for (String audioType : audioTypes) {
            if (audioType.equals(type)) {
                return true;
            }
        }
        return false;
    }

    public boolean isDocument(String type) {
        for (String documentType : documentTypes) {
            if (documentType.equals(type)) {
                return true;
            }
        }
        return false;
    }

    public boolean isAllowed(String type) {
        return isImage(type) || isVideo(type) || isAudio(type) || isDocument(type);
    }

    public String getFileType(String fileName) {
        String[] split = fileName.split("\\.");
        return split[split.length - 1];
    }

    public String getRandomFileName(String fileName) {
        return UUID.randomUUID().toString() + "." + getFileType(fileName);
    }

    public String getFilePath(String fileName) {
        return path + fileName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
