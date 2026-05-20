package com.alesso.postit;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class PostItListBean {
    private List<PostItBean> postItList;

    public PostItListBean() {
        this.postItList = new LinkedList<>();
    }

    public List<PostItBean> getPostItList() {
        return postItList;
    }

    public void addToList(PostItBean postIt) {
        this.postItList.add(postIt);
    }

    public PostItBean updateInList(String id, String content) {
        PostItBean filteredPostIt = this.findPostItById(id);

        filteredPostIt.setContent(content);
        return filteredPostIt;
    }

    public void deleteInList(String id) {
        this.postItList = this.postItList.stream()
                .filter(post -> !post.getId().equals(id))
                .collect(Collectors.toList());
    }

    public PostItBean findPostItById(String id) {
        return this.postItList.stream()
                .filter(post -> post.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

}
