package com.pdc.jdbctickets.beans;

import java.util.LinkedList;
import java.util.List;

public class TicketListBean {
    private List<TicketBean> tickets;

    public TicketListBean() {
        this.tickets = new LinkedList<>();
    }

    public List<TicketBean> getTickets() {
        return tickets;
    }

    public void addTicket(TicketBean ticket) {
        this.tickets.add(ticket);
    }


}
