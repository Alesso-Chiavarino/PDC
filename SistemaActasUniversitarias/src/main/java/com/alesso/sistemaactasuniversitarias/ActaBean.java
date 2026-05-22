package com.alesso.sistemaactasuniversitarias;

import java.util.Date;
import java.util.List;

public class ActaBean {

    private int id;
    private String materia;
    private Date fechaExamen; // Ahora es un objeto Date
    private List<InscripcionBean> inscripciones;
    private boolean firmada;
    private String filtroActivo;

    public ActaBean() {
    }

    public ActaBean(int id, String materia, Date fechaExamen, List<InscripcionBean> inscripciones) {
        this.id = id;
        this.materia = materia;
        this.fechaExamen = fechaExamen;
        this.inscripciones = inscripciones;
        this.firmada = false;
        this.filtroActivo = "TODOS";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public Date getFechaExamen() {
        return fechaExamen;
    }

    public void setFechaExamen(Date fechaExamen) {
        this.fechaExamen = fechaExamen;
    }

    public List<InscripcionBean> getInscripciones() {
        return inscripciones;
    }

    public void setInscripciones(List<InscripcionBean> inscripciones) {
        this.inscripciones = inscripciones;
    }

    public boolean isFirmada() {
        return firmada;
    }

    public void setFirmada(boolean firmada) {
        this.firmada = firmada;
    }

    public String getFiltroActivo() {
        return filtroActivo;
    }

    public void setFiltroActivo(String filtroActivo) {
        this.filtroActivo = filtroActivo;
    }

    public boolean isAsistenciaPerfecta() {
        for (InscripcionBean inscripcion : inscripciones) {
            if (inscripcion.isAusente()) {
                return false;
            }
        }
        return true;
    }
}