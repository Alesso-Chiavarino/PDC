package com.alesso.demo;

import java.util.Objects;
import java.util.UUID;

public class CalendarBean {

    private String date;
    private Boolean notificate;
    private Boolean notNotificate;
    private String emailToAdvise;
    private String priority;
    private String description;
    private Boolean isDiscarted;
    private String id;

    public CalendarBean() {
        this.id = UUID.randomUUID().toString();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        if (id != null && !id.isEmpty()) {
            this.id = id;
        }
    }

    public Boolean getDiscarted() {
        return isDiscarted;
    }

    public void setDiscarted(Boolean discarted) {
        isDiscarted = discarted;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Boolean getNotificate() {
        return notificate;
    }

    public void setNotificate(Boolean notificate) {
        this.notificate = notificate;
    }

    public Boolean getNotNotificate() {
        return notNotificate;
    }

    public void setNotNotificate(Boolean notNotificate) {
        this.notNotificate = notNotificate;
    }

    public String getEmailToAdvise() {
        return emailToAdvise;
    }

    public void setEmailToAdvise(String emailToAdvise) {
        this.emailToAdvise = emailToAdvise;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
