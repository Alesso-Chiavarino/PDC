package com.pdc.juegomayormenor;

public class RandomNumberBean {
    private Integer randomNumber;

    public Integer getRandomNumber() {
        return randomNumber;
    }

    public void setRandomNumber(Integer number) {
        this.randomNumber = number;
    }

    public Integer generateNumber() {
        return Double.class.cast(Math.random() * 20).intValue();
    }

    public void setGeneratedRandomNumber() {
        this.randomNumber = generateNumber();
    }
}
