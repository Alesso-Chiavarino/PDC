package com.alesso.abmvideos;

import javax.swing.text.Utilities;
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

    public void setId(String id) {
        this.id = id;
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
        if (this.title == null) { //se esta creando, no actualizando, entonce agrego id
            this.setId(UUID.randomUUID().toString());
        }
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
