package com.alesso.postit;

import java.util.UUID;

public class PostItBean {
    private String color;
    private String content;
    private String id;

    public PostItBean() {
        if (this.id == null) {
            this.setId(UUID.randomUUID().toString());
        }
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
