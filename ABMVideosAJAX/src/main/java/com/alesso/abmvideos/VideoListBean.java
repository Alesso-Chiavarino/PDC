package com.alesso.abmvideos;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class VideoListBean {
    private List<VideoBean> videoListBean;

    public VideoListBean() {
        this.videoListBean = new LinkedList<>();
    }

    public List<VideoBean> getVideoListBean() {
        return videoListBean;
    }

    public void setVideoListBean(List<VideoBean> videoListBean) {
        this.videoListBean = videoListBean;
    }

    public void addToList(VideoBean videoBean) {
        System.out.println(videoBean);
        this.videoListBean.add(videoBean);
    }

    public void updateInList(String id, VideoBean videoBean) {
        VideoBean filteredVideo = this.getVideoById(id);

        if (filteredVideo == null) {
            return;
        }

        filteredVideo.setAuthor(videoBean.getAuthor());
        filteredVideo.setCategory(videoBean.getCategory());
        filteredVideo.setUrl(videoBean.getUrl());
        filteredVideo.setTitle(videoBean.getTitle());
    }

    public void deleteInList(String id) {
        this.videoListBean = this.videoListBean
                .stream()
                .filter(vid -> !vid.getId().equals(id))
                .collect(Collectors.toList());


    }

    public VideoBean getVideoById(String id) {
        return this.videoListBean.stream()
                .filter(video -> video.getId().equals(id))
                .findFirst()
                .orElse(null);

    }
}
