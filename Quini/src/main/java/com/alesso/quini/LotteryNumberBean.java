package com.alesso.quini;

import java.util.LinkedList;
import java.util.List;

public class LotteryNumberBean {
    private Integer lotteryNumber;

    public Integer getLotteryNumber() {
        return lotteryNumber;
    }

    public void setLotteryNumber(Integer lotteryNumber) {
        this.lotteryNumber = lotteryNumber;
    }


    public Integer generateNumber() {
        return Double.class.cast(Math.random() * 45).intValue();
    }

    public void setGeneratedLotteryNumber() {
        this.lotteryNumber = generateNumber();
    }
}
