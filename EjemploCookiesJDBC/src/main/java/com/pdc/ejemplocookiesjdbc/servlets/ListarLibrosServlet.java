package com.pdc.ejemplocookiesjdbc.servlets;

import com.pdc.ejemplocookiesjdbc.beans.LibroBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet("/listarLibros.jsp")
public class ListarLibrosServlet extends HttpServlet {

    private static final String CONNECTION_URL =
            "jdbc:sqlserver://pdc-server.database.windows.net:1433;database=BibliotecaCookiesDemo;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<LibroBean> libros = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            int pagina = parseEntero(request.getParameter("pagina"), 1);
            int tamPagina = obtenerTamPagina(request);
            String textoBusqueda = request.getParameter("textoBusqueda");
            int offset = (pagina - 1) * tamPagina;
            int totalRegistros = 0;

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL);
                 PreparedStatement stmt = conn.prepareStatement(
                         "select id_libro  = l.id_libro, " +
                                 "       titulo    = l.titulo, " +
                                 "       autor     = l.autor, " +
                                 "       categoria = l.categoria " +
                                 "from dbo.libros l " +
                                 "where l.titulo like '%' + isnull(ltrim(rtrim(?)), '') + '%' " +
                                 "   or l.autor like '%' + isnull(ltrim(rtrim(?)), '') + '%' " +
                                 "order by l.titulo " +
                                 "offset ? rows fetch next ? rows only");
                 PreparedStatement countStmt = conn.prepareStatement(
                         "select count(*) total " +
                                 "from dbo.libros l " +
                                 "where l.titulo like '%' + isnull(ltrim(rtrim(?)), '') + '%' " +
                                 "   or l.autor like '%' + isnull(ltrim(rtrim(?)), '') + '%'")) {

                stmt.setString(1, textoBusqueda);
                stmt.setString(2, textoBusqueda);
                stmt.setInt(3, offset);
                stmt.setInt(4, tamPagina);

                try (ResultSet result = stmt.executeQuery()) {
                    while (result.next()) {
                        LibroBean libro = new LibroBean();
                        libro.setIdLibro(result.getInt("id_libro"));
                        libro.setTitulo(result.getString("titulo"));
                        libro.setAutor(result.getString("autor"));
                        libro.setCategoria(result.getString("categoria"));
                        libros.add(libro);
                    }
                }

                countStmt.setString(1, textoBusqueda);
                countStmt.setString(2, textoBusqueda);

                try (ResultSet countResult = countStmt.executeQuery()) {
                    if (countResult.next()) {
                        totalRegistros = countResult.getInt("total");
                    }
                }
            }

            int totalPaginas = (int) Math.ceil((double) totalRegistros / tamPagina);
            if (totalPaginas == 0) {
                totalPaginas = 1;
            }

            request.setAttribute("libros", libros);
            request.setAttribute("paginaActual", pagina);
            request.setAttribute("tamPagina", tamPagina);
            request.setAttribute("totalPaginas", totalPaginas);
            request.setAttribute("totalRegistros", totalRegistros);
            request.setAttribute("textoBusqueda", textoBusqueda == null ? "" : textoBusqueda);
            request.getRequestDispatcher("/components/librosTabla.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }

    private int obtenerTamPagina(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("tamPaginaPreferido".equals(cookie.getName())) {
                    return parseEntero(cookie.getValue(), 5);
                }
            }
        }
        return 5;
    }

    private int parseEntero(String valor, int valorDefault) {
        try {
            return Integer.parseInt(valor);
        } catch (NumberFormatException ex) {
            return valorDefault;
        }
    }
}
