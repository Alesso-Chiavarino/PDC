package com.pdc.juegomayormenor;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class RandomNumberListBean {
    private List<RandomNumberBean> randomNumberList;
    private Integer comparedNumber = 10;
    private Boolean isCurrentPredictionCorrect;

    public RandomNumberListBean() {
        this.randomNumberList = new LinkedList<>();
    }

    public List<RandomNumberBean> getRandomNumberList() {
        return randomNumberList;
    }

    public void setRandomNumberList(List<RandomNumberBean> randomNumberList) {
        this.randomNumberList = randomNumberList;
    }

    public Boolean addRandomNumberToList(RandomNumberBean randomNumber, String predictionSelection) {
        this.isCurrentPredictionCorrect = false;

        switch (predictionSelection) {
            case "MAYOR": {
                this.isCurrentPredictionCorrect = randomNumber.getRandomNumber() > this.comparedNumber;

            }
            case "IGUAL": {
                this.isCurrentPredictionCorrect = Objects.equals(randomNumber.getRandomNumber(), this.comparedNumber);
            }
            case "MENOR": {
                this.isCurrentPredictionCorrect = randomNumber.getRandomNumber() < this.comparedNumber;
            }

        }

        this.randomNumberList.add(randomNumber);
        return isCurrentPredictionCorrect;
    }
}
