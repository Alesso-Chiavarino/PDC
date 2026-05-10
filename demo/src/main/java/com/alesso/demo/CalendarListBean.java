package com.alesso.demo;

import java.util.LinkedList;
import java.util.List;

public class CalendarListBean {
    private List<CalendarBean> calendarList;

    public CalendarListBean() {
        this.calendarList = new LinkedList<CalendarBean>();
    }

    public void addCalendar(CalendarBean calendar){
        System.out.println(calendar);
        this.calendarList.add(calendar);
    }

    public List<CalendarBean> getCalendarList() {
        return calendarList;
    }
}
