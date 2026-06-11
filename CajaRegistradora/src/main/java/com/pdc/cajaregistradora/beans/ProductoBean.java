package com.pdc.cajaregistradora.beans;

import java.math.BigDecimal;

public class ProductoBean {
    private Integer nroProducto;
    private String codBarra;
    private String nomProducto;
    private BigDecimal precio;

    public Integer getNroProducto() {
        return nroProducto;
    }

    public void setNroProducto(Integer nroProducto) {
        this.nroProducto = nroProducto;
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
