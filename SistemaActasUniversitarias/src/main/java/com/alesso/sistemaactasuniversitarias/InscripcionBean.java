package com.alesso.sistemaactasuniversitarias;

public class InscripcionBean {

    private int id;
    private String legajo;
    private String nombreCompleto;
    private boolean ausente;

    public InscripcionBean() {
    }

    public InscripcionBean(int id, String legajo, String nombreCompleto) {
        this.id = id;
        this.legajo = legajo;
        this.nombreCompleto = nombreCompleto;
        this.ausente = false; // Por defecto todos están presentes al generar el acta
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLegajo() {
        return legajo;
    }

    public void setLegajo(String legajo) {
        this.legajo = legajo;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public boolean isAusente() {
        return ausente;
    }

    public void setAusente(boolean ausente) {
        this.ausente = ausente;
    }
}