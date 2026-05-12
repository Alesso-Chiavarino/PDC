package com.pdc.abmhuellas;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class FingerListBean {
    private List<FingerBean> fingerList;

    public FingerListBean() {
        this.initList();
    }

    public List<FingerBean> getFingerList() {
        return fingerList;
    }

    public void setFingerList(List<FingerBean> fingerList) {
        this.fingerList = fingerList;
    }

    private void initList() {

        fingerList = new ArrayList<>();

        HashMap<String, String> dedos = new HashMap<String, String>();

        dedos.put("P", "Pulgar");

        dedos.put("I", "Índice");

        dedos.put("MD", "Medio");

        dedos.put("A", "Anular");

        dedos.put("MQ", "Meñique");

        dedos.forEach((type, name) -> {
            FingerBean currentFinger = new FingerBean();
            currentFinger.setLabel(name);
            currentFinger.setType(type);

            this.fingerList.add(currentFinger);
        });
    }
}
