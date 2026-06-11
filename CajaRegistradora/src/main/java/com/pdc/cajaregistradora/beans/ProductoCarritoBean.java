package com.pdc.cajaregistradora.beans;

import java.math.BigDecimal;

public class ProductoCarritoBean {
    private int nroDetalle;
    private String codBarra;
    private String nomProducto;
    private BigDecimal precio;

    public int getNroDetalle() {
        return nroDetalle;
    }

    public void setNroDetalle(int nroDetalle) {
        this.nroDetalle = nroDetalle;
    }

    public String getCodBarra() {
        return codBarra;
    }

    public void setCodBarra(String codBarra) {
        this.codBarra = codBarra;
    }

    public String getNomProducto() {
        return nomProducto;
    }

    public void setNomProducto(String nomProducto) {
        this.nomProducto = nomProducto;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }
}
