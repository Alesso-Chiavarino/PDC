package com.munoz.parcialjdbc.beans;

public class ProductoBean {

    public int nroDetalle;
    public String codBarra;
    public String nomProducto;
    public Float precio;

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

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }
}
