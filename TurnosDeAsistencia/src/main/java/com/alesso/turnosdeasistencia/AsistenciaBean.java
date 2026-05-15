package com.alesso.turnosdeasistencia;

import java.util.UUID;

public class AsistenciaBean {
    private String id;
    private String fecha;
    private String hora;
    private ClienteBean cliente;

    public AsistenciaBean() {
        if (this.getId() == null) {
            this.setId(UUID.randomUUID().toString());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public ClienteBean getCliente() {
        return cliente;
    }

    public void setCliente(ClienteBean cliente) {
        this.cliente = cliente;
    }
}
