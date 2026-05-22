package com.alesso.sistemaactasuniversitarias;

import java.util.LinkedList;
import java.util.List;

public class ActaManagerBean {

    private List<ActaBean> actas;

    public ActaManagerBean() {
        actas = new LinkedList<>();
        generarDatos();
    }

    public List<ActaBean> getActas() {
        return actas;
    }

    public void registrarAusencia(int idActa, int idInscripcion) throws Exception {
        ActaBean acta = getActaById(idActa);
        if (acta.isFirmada()) {
            throw new Exception("No se pueden modificar asistencias de un acta ya firmada.");
        }

        for (InscripcionBean inscripcion : acta.getInscripciones()) {
            if (inscripcion.getId() == idInscripcion) {
                if (inscripcion.isAusente()) {
                    throw new Exception("El alumno ya fue marcado como ausente.");
                }
                inscripcion.setAusente(true);
                return;
            }
        }
        throw new Exception("Inscripción no encontrada.");
    }

    public void firmarActa(int idActa, boolean firmar) throws Exception {
        ActaBean acta = getActaById(idActa);
        acta.setFirmada(firmar);
    }

    public void cambiarFiltro(int idActa, String nuevoFiltro) throws Exception {
        ActaBean acta = getActaById(idActa);
        // Validar que el filtro sea correcto (TODOS, PRESENTES, AUSENTES)
        acta.setFiltroActivo(nuevoFiltro);
    }

    // Método utilitario para devolver sólo la sub-lista filtrada (útil para el JSP fragmentado)
    public List<InscripcionBean> getInscripcionesFiltradas(int idActa) throws Exception {
        ActaBean acta = getActaById(idActa);
        List<InscripcionBean> filtrados = new LinkedList<>();

        for (InscripcionBean ins : acta.getInscripciones()) {
            if (acta.getFiltroActivo().equals("TODOS")) {
                filtrados.add(ins);
            } else if (acta.getFiltroActivo().equals("PRESENTES") && !ins.isAusente()) {
                filtrados.add(ins);
            } else if (acta.getFiltroActivo().equals("AUSENTES") && ins.isAusente()) {
                filtrados.add(ins);
            }
        }
        return filtrados;
    }

    private ActaBean getActaById(int idActa) throws Exception {
        for (ActaBean acta : actas) {
            if (acta.getId() == idActa) {
                return acta;
            }
        }
        throw new Exception("El acta no existe.");
    }

    private void generarDatos() {
        List<InscripcionBean> alumnosActa1 = new LinkedList<>();
        alumnosActa1.add(new InscripcionBean(1, "VBP-1001", "Alvarez, Martín"));
        alumnosActa1.add(new InscripcionBean(2, "VBP-1002", "Bustos, Lucía"));
        alumnosActa1.add(new InscripcionBean(3, "VBP-1003", "Cáceres, Roberto"));
        alumnosActa1.add(new InscripcionBean(4, "VBP-1004", "Domínguez, Clara"));

        // La fecha se genera como objeto
        actas.add(new ActaBean(9001, "Programación Distribuida", java.sql.Date.valueOf("2026-11-15"), alumnosActa1));

        List<InscripcionBean> alumnosActa2 = new LinkedList<>();
        alumnosActa2.add(new InscripcionBean(10, "VBP-2010", "Gómez, Ariel"));
        alumnosActa2.add(new InscripcionBean(11, "VBP-2011", "Herrera, Paula"));
        alumnosActa2.add(new InscripcionBean(12, "VBP-2012", "Ibarra, Luis"));

        actas.add(new ActaBean(9002, "Base de Datos II", java.sql.Date.valueOf("2026-11-16"), alumnosActa2));
    }
}