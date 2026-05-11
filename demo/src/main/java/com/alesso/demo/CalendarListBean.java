package com.alesso.demo;

import java.util.LinkedList;
import java.util.List;

public class CalendarListBean {
    private List<CalendarBean> calendarList;

    public CalendarListBean() {
        this.calendarList = new LinkedList<CalendarBean>();
    }

    public void addCalendar(CalendarBean calendar) {
        System.out.println(calendar);
        this.calendarList.add(calendar);
    }

    public List<CalendarBean> getCalendarList() {
        return calendarList;
    }

    public void toggleDiscarted(int calendarIndex) {
        if (calendarList == null || calendarList.isEmpty()) return;
        if (calendarIndex < 0 || calendarIndex >= calendarList.size()) return;

        CalendarBean calendarToUpdate = calendarList.get(calendarIndex);
        boolean actual = Boolean.TRUE.equals(calendarToUpdate.getDiscarted());
        calendarToUpdate.setDiscarted(!actual);
    }

}
