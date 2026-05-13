package com.alesso.abmvideos;

import java.util.UUID;

public class VideoBean {
    private String category;
    private String title;
    private String author;
    private String url;
    private String id;

    public String getId() {
        return id;
    }

    public VideoBean() {
        this.id = UUID.randomUUID().toString();
    }

    public void setId(String id) {
        if (id != null && !id.isEmpty()) {
            this.id = id;
        }
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
