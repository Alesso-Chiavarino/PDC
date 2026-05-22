package com.alesso.sistemaajaxconfiltros;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

public class PedidoManagerBean implements Serializable {

    private final List<PedidoBean> pedidos = new ArrayList<>();

    private String filtroActivo = "TODOS";
    private String textoBusqueda = "";
    private int paginaActual = 1;
    private final int tamanioPagina = 5;

    private String ordenCampo = "FECHA";
    private String ordenDireccion = "DESC";

    public PedidoManagerBean() {
        cargarDatosIniciales();
    }

    private void cargarDatosIniciales() {
        if (!pedidos.isEmpty()) {
            return;
        }

        pedidos.add(new PedidoBean(101, "Mercado La Estrella", "Harina 000", "PENDIENTE", LocalDate.of(2026, 5, 23), 12050, false));
        pedidos.add(new PedidoBean(102, "Panaderia San Jose", "Levadura fresca", "EN_PREPARACION", LocalDate.of(2026, 5, 24), 8450, true));
        pedidos.add(new PedidoBean(103, "Cocina de Nora", "Queso rallado", "ENTREGADO", LocalDate.of(2026, 5, 22), 15990, false));
        pedidos.add(new PedidoBean(104, "Bistro Norte", "Aceite de oliva", "PENDIENTE", LocalDate.of(2026, 5, 25), 23300, true));
        pedidos.add(new PedidoBean(105, "Eventos Arcoiris", "Azucar organica", "PENDIENTE", LocalDate.of(2026, 5, 26), 7800, false));
        pedidos.add(new PedidoBean(106, "Comedor El Sol", "Arroz doble carolina", "EN_PREPARACION", LocalDate.of(2026, 5, 24), 11200, false));
        pedidos.add(new PedidoBean(107, "Resto Don Carlos", "Tomate triturado", "ENTREGADO", LocalDate.of(2026, 5, 20), 9650, false));
        pedidos.add(new PedidoBean(108, "Parrilla 9 de Julio", "Carbon vegetal", "CANCELADO", LocalDate.of(2026, 5, 21), 13400, false));
        pedidos.add(new PedidoBean(109, "FoodTruck La Ruta", "Papas prefritas", "PENDIENTE", LocalDate.of(2026, 5, 27), 18600, true));
        pedidos.add(new PedidoBean(110, "Rotiseria Plaza", "Pollo trozado", "EN_PREPARACION", LocalDate.of(2026, 5, 23), 20400, true));
        pedidos.add(new PedidoBean(111, "Heladeria Polar", "Crema base", "ENTREGADO", LocalDate.of(2026, 5, 19), 14500, false));
        pedidos.add(new PedidoBean(112, "Viandas Aurora", "Bandejas termicas", "PENDIENTE", LocalDate.of(2026, 5, 28), 6900, false));
    }

    public List<PedidoBean> getPedidos() {
        return pedidos;
    }

    public String getFiltroActivo() {
        return filtroActivo;
    }

    public String getTextoBusqueda() {
        return textoBusqueda;
    }

    public int getPaginaActual() {
        return paginaActual;
    }

    public int getTamanioPagina() {
        return tamanioPagina;
    }

    public String getOrdenCampo() {
        return ordenCampo;
    }

    public String getOrdenDireccion() {
        return ordenDireccion;
    }

    public long getCantidadFiltrada() {
        return getPedidosFiltradosYOrdenados().size();
    }

    public int getTotalPaginas() {
        int cantidad = getPedidosFiltradosYOrdenados().size();
        int total = (int) Math.ceil((double) cantidad / tamanioPagina);
        return Math.max(total, 1);
    }

    public List<PedidoBean> getPedidosPaginados() {
        List<PedidoBean> filtrados = getPedidosFiltradosYOrdenados();
        int desde = (paginaActual - 1) * tamanioPagina;
        if (desde >= filtrados.size()) {
            return new ArrayList<>();
        }

        int hasta = Math.min(desde + tamanioPagina, filtrados.size());
        return filtrados.subList(desde, hasta);
    }

    public boolean cambiarFiltro(String filtroNuevo) {
        if (filtroNuevo == null || filtroNuevo.isBlank()) {
            filtroActivo = "TODOS";
        } else {
            filtroActivo = filtroNuevo.toUpperCase(Locale.ROOT);
        }
        paginaActual = 1;
        return true;
    }

    public boolean buscar(String texto) {
        textoBusqueda = texto == null ? "" : texto.trim();
        paginaActual = 1;
        return true;
    }

    public boolean cambiarPagina(String paginaNueva) {
        try {
            int paginaParseada = Integer.parseInt(paginaNueva);
            paginaActual = Math.max(1, paginaParseada);
        } catch (NumberFormatException ignored) {
            paginaActual = 1;
        }

        if (paginaActual > getTotalPaginas()) {
            paginaActual = getTotalPaginas();
        }
        return true;
    }

    public boolean ordenarPor(String campo) {
        if (campo == null || campo.isBlank()) {
            return false;
        }

        String campoNormalizado = campo.toUpperCase(Locale.ROOT);
        if (campoNormalizado.equals(ordenCampo)) {
            ordenDireccion = ordenDireccion.equals("ASC") ? "DESC" : "ASC";
        } else {
            ordenCampo = campoNormalizado;
            ordenDireccion = "ASC";
        }
        paginaActual = 1;
        return true;
    }

    public boolean cambiarEstadoPedido(String id, String estadoNuevo) {
        if (estadoNuevo == null || estadoNuevo.isBlank()) {
            return false;
        }

        PedidoBean pedido = getPedidoPorId(id);
        if (pedido == null) {
            return false;
        }

        pedido.setEstado(estadoNuevo.toUpperCase(Locale.ROOT));
        ajustarPaginaActual();
        return true;
    }

    public PedidoBean getPedidoPorId(String id) {
        try {
            int idParseado = Integer.parseInt(id);
            for (PedidoBean pedido : pedidos) {
                if (pedido.getId() == idParseado) {
                    return pedido;
                }
            }
        } catch (NumberFormatException ignored) {
            return null;
        }

        return null;
    }

    private void ajustarPaginaActual() {
        if (paginaActual > getTotalPaginas()) {
            paginaActual = getTotalPaginas();
        }
        if (paginaActual < 1) {
            paginaActual = 1;
        }
    }

    private List<PedidoBean> getPedidosFiltradosYOrdenados() {
        Comparator<PedidoBean> comparator = switch (ordenCampo) {
            case "CLIENTE" -> Comparator.comparing(PedidoBean::getCliente, String.CASE_INSENSITIVE_ORDER);
            case "PRODUCTO" -> Comparator.comparing(PedidoBean::getProducto, String.CASE_INSENSITIVE_ORDER);
            case "TOTAL" -> Comparator.comparingDouble(PedidoBean::getTotal);
            case "ESTADO" -> Comparator.comparing(PedidoBean::getEstado, String.CASE_INSENSITIVE_ORDER);
            case "ID" -> Comparator.comparingInt(PedidoBean::getId);
            case "FECHA" -> Comparator.comparing(PedidoBean::getFechaEntrega);
            default -> Comparator.comparing(PedidoBean::getFechaEntrega);
        };

        if ("DESC".equals(ordenDireccion)) {
            comparator = comparator.reversed();
        }

        return pedidos.stream()
                .filter(this::coincideConFiltro)
                .filter(this::coincideConBusqueda)
                .sorted(comparator)
                .collect(Collectors.toList());
    }

    private boolean coincideConFiltro(PedidoBean pedido) {
        if ("TODOS".equals(filtroActivo)) {
            return true;
        }
        return pedido.getEstado().equalsIgnoreCase(filtroActivo);
    }

    private boolean coincideConBusqueda(PedidoBean pedido) {
        if (textoBusqueda == null || textoBusqueda.isBlank()) {
            return true;
        }

        String termino = textoBusqueda.trim().toLowerCase(Locale.ROOT);
        boolean esNumerico = termino.matches("\\d+");

        if (esNumerico) {
            return String.valueOf(pedido.getId()).equals(termino);
        }

        return pedido.getCliente().toLowerCase(Locale.ROOT).contains(termino)
                || pedido.getProducto().toLowerCase(Locale.ROOT).contains(termino)
                || pedido.getEstado().toLowerCase(Locale.ROOT).contains(termino);
    }
}
