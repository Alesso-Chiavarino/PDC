package com.alesso.prode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MatchListBean {
    private List<MatchBean> matchList;

    public MatchListBean() {
        this.initList();
    }

    public List<MatchBean> getMatchList() {
        return matchList;
    }

    public void setMatchList(List<MatchBean> matchList) {
        this.matchList = matchList;
    }

    private void initList() {
        this.matchList = new ArrayList<>();

        List<List<String>> equipos = new ArrayList<List<String>>();

        equipos.add(Arrays.asList("EQUIPO A", "EQUIPO B"));

        equipos.add(Arrays.asList("EQUIPO C", "EQUIPO D"));

        equipos.add(Arrays.asList("EQUIPO E", "EQUIPO F"));

        equipos.add(Arrays.asList("EQUIPO G", "EQUIPO H"));

        equipos.add(Arrays.asList("EQUIPO I", "EQUIPO J"));

        equipos.add(Arrays.asList("EQUIPO K", "EQUIPO L"));

        equipos.add(Arrays.asList("EQUIPO M", "EQUIPO N"));

        equipos.add(Arrays.asList("EQUIPO O", "EQUIPO P"));

        equipos.add(Arrays.asList("EQUIPO Q", "EQUIPO R"));

        equipos.add(Arrays.asList("EQUIPO S", "EQUIPO T"));

        equipos.forEach(pair -> {
            MatchBean currentMatch = new MatchBean();
            currentMatch.setFirstTeam(pair.get(0));
            currentMatch.setSecondTeam(pair.get(1));
            this.matchList.add(currentMatch);
        });
    }
}
