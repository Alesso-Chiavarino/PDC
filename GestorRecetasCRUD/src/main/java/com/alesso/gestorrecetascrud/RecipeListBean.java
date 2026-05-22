package com.alesso.gestorrecetascrud;

import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class RecipeListBean {
    private List<RecipeBean> recipeList;

    public RecipeListBean() {
        this.recipeList = new LinkedList<>();
    }

    public List<RecipeBean> getRecipeList() {
        return recipeList;
    }

    public void addRecipe(RecipeBean recipe) {
        if (recipe.getPublicationDate() == null || recipe.getPublicationDate().isBlank()) {
            recipe.setPublicationDate(LocalDate.now().toString());
        }
        recipeList.add(recipe);
    }

    public RecipeBean updateRecipe(String id, RecipeBean recipe) {
        RecipeBean filteredRecipe = this.getRecipeById(id);

        filteredRecipe.setName(recipe.getName());
        filteredRecipe.setAuthor(recipe.getAuthor());
        filteredRecipe.setDescription(recipe.getDescription());
        filteredRecipe.setInstructions(recipe.getInstructions());
        filteredRecipe.setCategory(recipe.getCategory());
        filteredRecipe.setDifficulty(recipe.getDifficulty());
        filteredRecipe.setSlices(recipe.getSlices());
        filteredRecipe.setTime(recipe.getTime());
        filteredRecipe.setCost(recipe.getCost());
        filteredRecipe.setTraditional(recipe.getTraditional());
        filteredRecipe.setHealthy(recipe.getHealthy());
        filteredRecipe.setGourmet(recipe.getGourmet());
        if (recipe.getPublicationDate() == null || recipe.getPublicationDate().isBlank()) {
            if (filteredRecipe.getPublicationDate() == null || filteredRecipe.getPublicationDate().isBlank()) {
                filteredRecipe.setPublicationDate(LocalDate.now().toString());
            }
        } else {
            filteredRecipe.setPublicationDate(recipe.getPublicationDate());
        }
        filteredRecipe.setImage(recipe.getImage());
        filteredRecipe.setSuitableCeliacs(recipe.getSuitableCeliacs());
        filteredRecipe.setVegan(recipe.getVegan());
        filteredRecipe.setLactoseFree(recipe.getLactoseFree());
        filteredRecipe.setSpicy(recipe.getSpicy());

        return filteredRecipe;
    }

    public void deleteRecipe(String id) {
        this.recipeList = this.recipeList.stream()
                .filter(recipe -> !recipe.getId().equals(id))
                .collect(Collectors.toList());
    }

    public RecipeBean getRecipeById(String id) {
        return this.recipeList.stream()
                .filter(recipe -> recipe.getId().equals(id))
                .findFirst()
                .orElse(null);
    }


}
