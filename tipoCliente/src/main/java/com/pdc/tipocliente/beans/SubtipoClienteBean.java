package com.pdc.tipocliente.beans;

public class SubtipoClienteBean {
    private String codTipoCliente;
    private int nroSubtipo;
    private String nomTipoCliente;
    private String habilitado;

    public String getCodTipoCliente() {
        return codTipoCliente;
    }

    public void setCodTipoCliente(String codTipoCliente) {
        this.codTipoCliente = codTipoCliente;
    }

    public int getNroSubtipo() {
        return nroSubtipo;
    }

    public void setNroSubtipo(int nroSubtipo) {
        this.nroSubtipo = nroSubtipo;
    }

    public String getNomTipoCliente() {
        return nomTipoCliente;
    }

    public void setNomTipoCliente(String nomTipoCliente) {
        this.nomTipoCliente = nomTipoCliente;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }
}
