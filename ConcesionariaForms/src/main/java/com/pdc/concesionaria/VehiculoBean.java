package com.pdc.concesionaria;

import java.util.Date;

public class VehiculoBean {
    private String nroChasis;
    private String marca;
    private String modelo;
    private int fabricadoEn;
    private String estado;
    private String dominio;
    private String cuilPropietario;
    private Date fechaBaja;
    private Date fechaEntrega;

    private String nombre;

    public String getNroChasis() {
        return nroChasis;
    }

    public void setNroChasis(String nroChasis) {
        this.nroChasis = nroChasis;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getFabricadoEn() {
        return fabricadoEn;
    }

    public void setFabricadoEn(int fabricadoEn) {
        this.fabricadoEn = fabricadoEn;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDominio() {
        return dominio;
    }

    public void setDominio(String dominio) {
        this.dominio = dominio;
    }

    public String getCuilPropietario() {
        return cuilPropietario;
    }

    public void setCuilPropietario(String cuilPropietario) {
        this.cuilPropietario = cuilPropietario;
    }

    public Date getFechaBaja() {
        return fechaBaja;
    }

    public void setFechaBaja(Date fechaBaja) {
        this.fechaBaja = fechaBaja;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
