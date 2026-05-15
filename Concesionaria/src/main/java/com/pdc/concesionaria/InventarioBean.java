package com.pdc.concesionaria;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InventarioBean {
    private final List<VehiculoBean> listado;

    public InventarioBean() {
        listado = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        try {
            VehiculoBean v1 = new VehiculoBean();
            v1.setNroChasis("CH234567");
            v1.setMarca("Chevrolet");
            v1.setModelo("2023");
            v1.setFabricadoEn(2023);
            v1.setNombre("Chevrolet Civic");
            v1.setEstado("DE");
            v1.setDominio("AF789DE");
            listado.add(v1);

            VehiculoBean v2 = new VehiculoBean();
            v2.setNroChasis("CH789012");
            v2.setMarca("Fiat");
            v2.setModelo("2020");
            v2.setFabricadoEn(2020);
            v2.setNombre("Fiat Argo");
            v2.setEstado("ENT");
            v2.setDominio("AE234TT");
            v2.setCuilPropietario("27890123456");
            v2.setFechaEntrega(sdf.parse("07-04-2025"));
            listado.add(v2);

            VehiculoBean v3 = new VehiculoBean();
            v3.setNroChasis("CH654321");
            v3.setMarca("Ford");
            v3.setModelo("2021");
            v3.setFabricadoEn(2021);
            v3.setNombre("Ford Fiesta");
            v3.setEstado("ENT");
            v3.setDominio("AB456VV");
            v3.setCuilPropietario("20345678901");
            v3.setFechaEntrega(sdf.parse("07-03-2025"));
            listado.add(v3);

            VehiculoBean v4 = new VehiculoBean();
            v4.setNroChasis("CH901234");
            v4.setMarca("Honda");
            v4.setModelo("2019");
            v4.setFabricadoEn(2019);
            v4.setNombre("Honda Civic");
            v4.setEstado("DE");
            v4.setDominio("AC901VE");
            listado.add(v4);

            VehiculoBean v5 = new VehiculoBean();
            v5.setNroChasis("CH001234");
            v5.setMarca("Hyundai");
            v5.setModelo("2021");
            v5.setFabricadoEn(2021);
            v5.setNombre("Hyundai HB20");
            v5.setEstado("BA");
            v5.setDominio("AE890TE");
            v5.setFechaBaja(sdf.parse("10-01-2025"));
            listado.add(v5);

            VehiculoBean v6 = new VehiculoBean();
            v6.setNroChasis("CH900123");
            v6.setMarca("Nissan");
            v6.setModelo("2023");
            v6.setFabricadoEn(2023);
            v6.setNombre("Nissan Versa");
            v6.setEstado("DE");
            v6.setDominio("AG567DR");
            listado.add(v6);

            VehiculoBean v7 = new VehiculoBean();
            v7.setNroChasis("CH567890");
            v7.setMarca("Peugeot");
            v7.setModelo("2022");
            v7.setFabricadoEn(2022);
            v7.setNombre("Peugeot 208");
            v7.setEstado("DE");
            v7.setDominio("AF678ER");
            listado.add(v7);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<VehiculoBean> getListado() {
        return listado;
    }

    public void registrarBaja(String nroChasis) {
        VehiculoBean vehiculoFiltrado = this.filtrarVehiculo(nroChasis);
        vehiculoFiltrado.setEstado("BA");
        vehiculoFiltrado.setFechaBaja(new Date());
    }

    public void registrarEntrega(String nroChasis, String cuilPropietario) {
        VehiculoBean vehiculoFiltrado = this.filtrarVehiculo(nroChasis);
        vehiculoFiltrado.setCuilPropietario(cuilPropietario);
        vehiculoFiltrado.setFechaEntrega(new Date());
        vehiculoFiltrado.setEstado("ENT");
    }

    public void registrarDominio(String nroChasis, String estado, String dominio) {
        VehiculoBean vehiculoFiltrado = this.filtrarVehiculo(nroChasis);
        vehiculoFiltrado.setEstado(estado);
        vehiculoFiltrado.setDominio(dominio);
    }

    public VehiculoBean filtrarVehiculo(String nroChasis) {
        VehiculoBean vehiculoFiltrado = this.listado.stream()
                .filter(ve -> ve.getNroChasis().equals(nroChasis))
                .findFirst()
                .orElse(null);

        return vehiculoFiltrado;

    }

}
