package com.pdc.concesionaria;

import java.util.HashMap;

public class EstadosVehiculoBean {
    private HashMap<String, String> listado;

    public EstadosVehiculoBean() {
        listado = new HashMap<>();
        listado.put("DE", "En despósito");
        listado.put("PE", "Pendiente de entrega");
        listado.put("ENT", "Entregado");
        listado.put("BA", "Dado de baja");
    }

    public HashMap<String, String> getListado() {
        return listado;
    }
}
