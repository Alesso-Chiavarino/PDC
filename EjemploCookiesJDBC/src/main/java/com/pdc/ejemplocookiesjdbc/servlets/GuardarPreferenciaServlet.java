package com.pdc.ejemplocookiesjdbc.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/guardarPreferencia.jsp")
public class GuardarPreferenciaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int tamPagina = parseEntero(request.getParameter("tamPagina"), 5);

        Cookie cookie = new Cookie("tamPaginaPreferido", String.valueOf(tamPagina));
        cookie.setMaxAge(60 * 60 * 24 * 7);
        cookie.setPath("/");
        response.addCookie(cookie);

        request.setAttribute("tipoMensaje", "success");
        request.setAttribute("tituloMensaje", "Cookie creada");
        request.setAttribute("mensaje", "Se guardo la preferencia de cantidad por pagina.");
        request.setAttribute("detalleMensaje", "Tamano guardado: " + tamPagina);
        request.getRequestDispatcher("/components/mensajeOperacion.jsp").forward(request, response);
    }

    private int parseEntero(String valor, int valorDefault) {
        try {
            return Integer.parseInt(valor);
        } catch (NumberFormatException ex) {
            return valorDefault;
        }
    }
}
