package com.alesso.gestorrecetascrud;

import java.util.UUID;

public class RecipeBean {
    private String name;
    private String author;
    private String description;
    private String instructions;
    private String category;
    private String difficulty;
    private int slices;
    private int time;
    private int cost;
    private String traditional;
    private String healthy;
    private String gourmet;
    private String publicationDate;
    private String image;
    private String suitableCeliacs;
    private String vegan;
    private String lactoseFree;
    private String spicy;
    private String id;


    public RecipeBean() {
        if (this.getId() == null) {
            this.setId(UUID.randomUUID().toString());
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public int getSlices() {
        return slices;
    }

    public void setSlices(int slices) {
        this.slices = slices;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public String getTraditional() {
        return traditional;
    }

    public void setTraditional(String traditional) {
        this.traditional = traditional;
    }

    public String getHealthy() {
        return healthy;
    }

    public void setHealthy(String healthy) {
        this.healthy = healthy;
    }

    public String getGourmet() {
        return gourmet;
    }

    public void setGourmet(String gourmet) {
        this.gourmet = gourmet;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSuitableCeliacs() {
        return suitableCeliacs;
    }

    public void setSuitableCeliacs(String suitableCeliacs) {
        this.suitableCeliacs = suitableCeliacs;
    }

    public String getVegan() {
        return vegan;
    }

    public void setVegan(String vegan) {
        this.vegan = vegan;
    }

    public String getLactoseFree() {
        return lactoseFree;
    }

    public void setLactoseFree(String lactoseFree) {
        this.lactoseFree = lactoseFree;
    }

    public String getSpicy() {
        return spicy;
    }

    public void setSpicy(String spicy) {
        this.spicy = spicy;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
