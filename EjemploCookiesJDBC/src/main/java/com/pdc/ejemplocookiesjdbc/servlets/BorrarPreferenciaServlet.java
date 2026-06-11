package com.pdc.ejemplocookiesjdbc.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/borrarPreferencia.jsp")
public class BorrarPreferenciaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie cookie = new Cookie("tamPaginaPreferido", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        request.setAttribute("tipoMensaje", "warning");
        request.setAttribute("tituloMensaje", "Cookie borrada");
        request.setAttribute("mensaje", "Se elimino la preferencia guardada.");
        request.setAttribute("detalleMensaje", "La proxima consulta usara el valor por defecto.");
        request.getRequestDispatcher("/components/mensajeOperacion.jsp").forward(request, response);
    }
}
