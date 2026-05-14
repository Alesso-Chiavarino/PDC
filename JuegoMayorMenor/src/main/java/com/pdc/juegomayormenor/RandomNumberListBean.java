package com.pdc.juegomayormenor;

import java.util.LinkedList;
import java.util.List;
import java.util.Objects;

public class RandomNumberListBean {
    private List<RandomNumberBean> randomNumberList;
    private int comparedNumber = 10;
    private Boolean isCurrentPredictionCorrect;
    private int accuratePredictions = 0;

    public RandomNumberListBean() {
        this.randomNumberList = new LinkedList<>();
    }

    public List<RandomNumberBean> getRandomNumberList() {
        return randomNumberList;
    }

    public void setRandomNumberList(List<RandomNumberBean> randomNumberList) {
        this.randomNumberList = randomNumberList;
    }

    public Integer getAccuratePredictions() {
        return accuratePredictions;
    }

    public void setAccuratePredictions(Integer accuratePredictions) {
        this.accuratePredictions = accuratePredictions;
    }

    public Boolean getCurrentPredictionCorrect() {
        return isCurrentPredictionCorrect;
    }

    public void setCurrentPredictionCorrect(Boolean currentPredictionCorrect) {
        isCurrentPredictionCorrect = currentPredictionCorrect;
    }

    public Integer getComparedNumber() {
        return comparedNumber;
    }

    public void setComparedNumber(Integer comparedNumber) {
        this.comparedNumber = comparedNumber;
    }

    public Boolean addRandomNumberToList(RandomNumberBean randomNumber, String predictionSelection) {
        this.isCurrentPredictionCorrect = false;

        switch (predictionSelection) {
            case "MAYOR": {
                this.isCurrentPredictionCorrect = randomNumber.getRandomNumber() > this.comparedNumber;
                break;
            }
            case "IGUAL": {
                this.isCurrentPredictionCorrect = Objects.equals(randomNumber.getRandomNumber(), this.comparedNumber);
                break;
            }
            case "MENOR": {
                this.isCurrentPredictionCorrect = randomNumber.getRandomNumber() < this.comparedNumber;
                break;
            }

        }

        if (this.isCurrentPredictionCorrect) {
            this.setAccuratePredictions(this.getAccuratePredictions() + 1);
        }

        System.out.println(predictionSelection);
        System.out.println(isCurrentPredictionCorrect);
        System.out.println(randomNumber.getRandomNumber());
        this.randomNumberList.add(randomNumber);
        return isCurrentPredictionCorrect;
    }
}
