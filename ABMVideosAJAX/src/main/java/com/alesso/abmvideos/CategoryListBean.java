package com.alesso.abmvideos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CategoryListBean {

    private List<CategoryBean> categoryListBean;

    private void initList() {

        categoryListBean = new ArrayList<>();

        HashMap<Integer, String> categoryList = new HashMap<Integer, String>();

        categoryList.put(1, "BLUE");

        categoryList.put(2, "CLÁSICA");

        categoryList.put(3, "COUNTRY");

        categoryList.put(4, "FUNK");

        categoryList.put(5, "HIP HOP");

        categoryList.put(6, "JAZZ");

        categoryList.put(7, "POP");

        categoryList.put(8, "ROCK");

        categoryList.put(9, "REGGAETON y TRAP");

        categoryList.put(10, "ROCK ALTERNATIVO");

        categoryList.forEach((position, name) -> {
            CategoryBean currentCategory = new CategoryBean();
            currentCategory.setName(name);
            currentCategory.setPosition(position);

            this.categoryListBean.add(currentCategory);
        });
    }

    public CategoryListBean() {
        this.initList();
    }

    public List<CategoryBean> getCategoryListBean() {
        return categoryListBean;
    }


}
