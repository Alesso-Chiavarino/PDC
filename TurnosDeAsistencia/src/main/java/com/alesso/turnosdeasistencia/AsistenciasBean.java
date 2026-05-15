package com.alesso.turnosdeasistencia;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class AsistenciasBean {
    private List<AsistenciaBean> asistencias;

    public AsistenciasBean() {
        this.asistencias = new LinkedList<>();
    }

    public List<AsistenciaBean> getAsistencias() {
        return asistencias;
    }

    public AsistenciaBean asignarCliente(ClienteBean cliente) {
        AsistenciaBean asistenciaBean = new AsistenciaBean();
        asistenciaBean.setFecha(new Date().toString());
        asistenciaBean.setHora(Integer.toString(new Date().getHours()));
        asistenciaBean.setCliente(cliente);

        asistencias.add(asistenciaBean);
        return asistenciaBean;
    }

    public AsistenciaBean editarAsistencia(String idAsistencia, ClienteBean cliente) {
        AsistenciaBean asistenciaFiltrada = asistencias.stream()
                .filter(asis -> asis.getId().equals(idAsistencia))
                .findFirst()
                .orElse(null);

        asistenciaFiltrada.setCliente(cliente);

        return asistenciaFiltrada;
    }
}
