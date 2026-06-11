package com.pdc.jdbctickets.beans;

public class TicketBean {
    private String ano_ticket;
    private String nro_ticket;
    private String fecha_ticket;
    private String asunto_ticket;
    private String texto_ticket;
    private String nro_solicitante;

    public String getAno_ticket() {
        return ano_ticket;
    }

    public void setAno_ticket(String ano_ticket) {
        this.ano_ticket = ano_ticket;
    }

    public String getNro_ticket() {
        return nro_ticket;
    }

    public void setNro_ticket(String nro_ticket) {
        this.nro_ticket = nro_ticket;
    }

    public String getFecha_ticket() {
        return fecha_ticket;
    }

    public void setFecha_ticket(String fecha_ticket) {
        this.fecha_ticket = fecha_ticket;
    }

    public String getAsunto_ticket() {
        return asunto_ticket;
    }

    public void setAsunto_ticket(String asunto_ticket) {
        this.asunto_ticket = asunto_ticket;
    }

    public String getTexto_ticket() {
        return texto_ticket;
    }

    public void setTexto_ticket(String texto_ticket) {
        this.texto_ticket = texto_ticket;
    }

    public String getNro_solicitante() {
        return nro_solicitante;
    }

    public void setNro_solicitante(String nro_solicitante) {
        this.nro_solicitante = nro_solicitante;
    }
}
