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

    public CalendarBean getCalendarById(String id) {
        if (calendarList == null || calendarList.isEmpty() || id == null) return null;
        return calendarList.stream()
                .filter(c -> id.equals(c.getId()))
                .findFirst()
                .orElse(null);
    }

    public Integer getCalendarIndexById(String id) {
        if (calendarList == null || calendarList.isEmpty() || id == null) return -1;
        for (int i = 0; i < calendarList.size(); i++) {
            if (id.equals(calendarList.get(i).getId())) return i;
        }
        return -1;
    }

    public CalendarBean getLastCalendar() {
        if (calendarList == null || calendarList.isEmpty()) return null;
        return calendarList.get(calendarList.size() - 1);
    }

    public Integer getLastCalendarIndex() {
        if (calendarList == null || calendarList.isEmpty()) return -1;
        return calendarList.size() - 1;
    }

    public void toggleDiscarted(String id) {
        if (calendarList == null || calendarList.isEmpty()) return;
        calendarList.stream()
                .filter(c -> id.equals(c.getId()))
                .findFirst()
                .ifPresent(c -> c.setDiscarted(!Boolean.TRUE.equals(c.getDiscarted())));
    }

}


/*
findFirst() (uno)
collect(toList()) (lista nueva)
count() (cantidad)
anyMatch() (existe?)*/

// Imports útiles para estos métodos:
// import java.util.ArrayList;
// import java.util.List;
// import java.util.Locale;
// import java.util.stream.Collectors;
// import java.util.stream.IntStream;

//public CalendarBean getCalendarById(String id) {
//    if (id == null || calendarList == null) return null;
//    return calendarList.stream()
//            .filter(c -> id.equals(c.getId()))
//            .findFirst()
//            .orElse(null);
//}
//
//public boolean existsById(String id) {
//    if (id == null || calendarList == null) return false;
//    return calendarList.stream()
//            .anyMatch(c -> id.equals(c.getId()));
//}
//
//public int getCalendarIndexById(String id) {
//    if (id == null || calendarList == null) return -1;
//    return IntStream.range(0, calendarList.size())
//            .filter(i -> id.equals(calendarList.get(i).getId()))
//            .findFirst()
//            .orElse(-1);
//}
//
//public List<CalendarBean> getActiveCalendars() {
//    if (calendarList == null) return new ArrayList<>();
//    return calendarList.stream()
//            .filter(c -> !Boolean.TRUE.equals(c.getDiscarted()))
//            .collect(Collectors.toList());
//}
//
//public List<CalendarBean> getDiscardedCalendars() {
//    if (calendarList == null) return new ArrayList<>();
//    return calendarList.stream()
//            .filter(c -> Boolean.TRUE.equals(c.getDiscarted()))
//            .collect(Collectors.toList());
//}
//
//public long countActiveCalendars() {
//    if (calendarList == null) return 0;
//    return calendarList.stream()
//            .filter(c -> !Boolean.TRUE.equals(c.getDiscarted()))
//            .count();
//}
//
//public long countByPriority(String priority) {
//    if (priority == null || calendarList == null) return 0;
//    return calendarList.stream()
//            .filter(c -> priority.equalsIgnoreCase(c.getPriority()))
//            .count();
//}
//
//public void toggleDiscarted(String id) {
//    if (id == null || calendarList == null) return;
//    calendarList.stream()
//            .filter(c -> id.equals(c.getId()))
//            .findFirst()
//            .ifPresent(c -> c.setDiscarted(!Boolean.TRUE.equals(c.getDiscarted())));
//}
//
//public boolean updateDescriptionById(String id, String newDescription) {
//    if (id == null || calendarList == null) return false;
//    CalendarBean found = calendarList.stream()
//            .filter(c -> id.equals(c.getId()))
//            .findFirst()
//            .orElse(null);
//
//    if (found == null) return false;
//    found.setDescription(newDescription);
//    return true;
//}
//
//public boolean deleteById(String id) {
//    if (id == null || calendarList == null) return false;
//    // removeIf es Collection API (muy útil en ABM)
//    return calendarList.removeIf(c -> id.equals(c.getId()));
//}
//
//public List<CalendarBean> searchByDescription(String text) {
//    if (calendarList == null) return new ArrayList<>();
//    if (text == null || text.isBlank()) return new ArrayList<>(calendarList);
//
//    String needle = text.toLowerCase(Locale.ROOT);
//    return calendarList.stream()
//            .filter(c -> c.getDescription() != null &&
//                    c.getDescription().toLowerCase(Locale.ROOT).contains(needle))
//            .collect(Collectors.toList());
//}
