package com.alesso.sistemaajaxconfiltros;

import java.io.Serializable;
import java.time.LocalDate;

public class PedidoBean implements Serializable {
    private int id;
    private String cliente;
    private String producto;
    private String estado;
    private LocalDate fechaEntrega;
    private double total;
    private boolean urgente;

    public PedidoBean() {
    }

    public PedidoBean(int id, String cliente, String producto, String estado, LocalDate fechaEntrega, double total, boolean urgente) {
        this.id = id;
        this.cliente = cliente;
        this.producto = producto;
        this.estado = estado;
        this.fechaEntrega = fechaEntrega;
        this.total = total;
        this.urgente = urgente;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public LocalDate getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(LocalDate fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isUrgente() {
        return urgente;
    }

    public void setUrgente(boolean urgente) {
        this.urgente = urgente;
    }
}
