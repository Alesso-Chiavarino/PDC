package com.pdc.ejemplocookiesjdbc.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/verPreferencia.jsp")
public class VerPreferenciaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tamPagina = null;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("tamPaginaPreferido".equals(cookie.getName())) {
                    tamPagina = cookie.getValue();
                    break;
                }
            }
        }

        if (tamPagina == null) {
            request.setAttribute("tipoMensaje", "secondary");
            request.setAttribute("tituloMensaje", "Sin cookie");
            request.setAttribute("mensaje", "Todavia no hay una preferencia guardada.");
            request.setAttribute("detalleMensaje", "Se usara el valor por defecto: 5 por pagina.");
        } else {
            request.setAttribute("tipoMensaje", "info");
            request.setAttribute("tituloMensaje", "Cookie leida");
            request.setAttribute("mensaje", "Preferencia actual encontrada en el navegador.");
            request.setAttribute("detalleMensaje", "Tamano por pagina guardado: " + tamPagina);
        }

        request.getRequestDispatcher("/components/mensajeOperacion.jsp").forward(request, response);
    }
}
