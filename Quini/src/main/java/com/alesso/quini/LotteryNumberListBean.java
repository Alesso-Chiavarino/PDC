package com.alesso.quini;

import java.util.LinkedList;
import java.util.List;

public class LotteryNumberListBean {
    private List<LotteryNumberBean> lotteryNumberList;
    private LotteryNumberBean currentNumber;
    private boolean isCompleted;

    public LotteryNumberBean getCurrentNumber() {
        return currentNumber;
    }

    public void setCurrentNumber(LotteryNumberBean currentNumber) {
        this.currentNumber = currentNumber;
    }

    public boolean isCompleted() {
        return isCompleted;
    }

    public void setCompleted(boolean completed) {
        isCompleted = completed;
    }

    public LotteryNumberListBean() {
        lotteryNumberList = new LinkedList<>();
    }

    public List<LotteryNumberBean> getLotteryNumberList() {
        return lotteryNumberList;
    }

    public void setLotteryNumberList(List<LotteryNumberBean> lotteryNumberList) {
        this.lotteryNumberList = lotteryNumberList;
    }

    public boolean resetSorteo() {
        lotteryNumberList.clear();
        currentNumber = null;
        isCompleted = false;
        return true;
    }

    public LotteryNumberBean drawNextNumber() {
        if (isCompleted) return null;

        if (lotteryNumberList.size() >= 6) {
            isCompleted = true;
            return null;
        }

        int generated;
        do {
            generated = (int) (Math.random() * 46);
        } while (containsNumber(generated));

        LotteryNumberBean lotteryNumber = new LotteryNumberBean();
        lotteryNumber.setLotteryNumber(generated);

        currentNumber = lotteryNumber;
        lotteryNumberList.add(lotteryNumber);

        if (lotteryNumberList.size() >= 6) {
            isCompleted = true;
        }

        return lotteryNumber;
    }

    private boolean containsNumber(int number) {
        return lotteryNumberList.stream()
                .anyMatch(item -> item.getLotteryNumber() != null && item.getLotteryNumber() == number);
    }

}
