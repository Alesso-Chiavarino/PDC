package com.pdc.abmhuellas;

import java.util.LinkedList;
import java.util.List;

public class FingerPrintListBean {
    private List<FingerPrintBean> fingerPrintList;

    public FingerPrintListBean() {
        fingerPrintList = new LinkedList<>();
    }

    public List<FingerPrintBean> getFingerPrintList() {
        return fingerPrintList;
    }

    public void setFingerPrintList(List<FingerPrintBean> fingerPrintList) {
        this.fingerPrintList = fingerPrintList;
    }

    public void addFingerPrint(FingerPrintBean fingerPrint) {
        System.out.println(fingerPrint);
        fingerPrintList.add(fingerPrint);
    }
}
