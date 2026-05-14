package com.alesso.quini;

import java.util.LinkedList;
import java.util.List;

public class LotteryNumberBean {
    private List<Integer> lotteryNumbers = new LinkedList<>();

    public LotteryNumberBean() {
        int num = generateNumber();

        if (lotteryNumbers.size() < 6) {
            lotteryNumbers.add(num);
        }

    }

    private boolean isComplete() {
        return lotteryNumbers.size() == 6;
    }

    public List<Integer> getLotteryNumbers() {
        return lotteryNumbers;
    }

    public void setLotteryNumbers(List<Integer> lotteryNumbers) {
        this.lotteryNumbers = lotteryNumbers;
    }

    public Integer generateNumber() {
        return Double.class.cast(Math.random() * 45).intValue();
    }
}
