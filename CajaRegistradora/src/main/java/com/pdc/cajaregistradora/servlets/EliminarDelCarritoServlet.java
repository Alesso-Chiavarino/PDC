package com.pdc.cajaregistradora.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/eliminarDelCarrito.jsp")
public class EliminarDelCarritoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Integer nroCarrito = (Integer) request.getSession().getAttribute("nroCarrito");
            int nroDetalle = Integer.parseInt(request.getParameter("nroDetalle"));

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=CajaRegistradora;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
                 PreparedStatement stmt = conn.prepareStatement(
                         "\n" +
                                 "delete d\n" +
                                 "  from dbo.detalle_carritos d\n" +
                                 " where d.nro_carrito = ?\n" +
                                 "   and d.nro_detalle = ?")) {

                conn.setAutoCommit(false);

                try {
                    stmt.setInt(1, nroCarrito);
                    stmt.setInt(2, nroDetalle);
                    stmt.executeUpdate();
                    conn.commit();
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }

            response.setStatus(200);

        } catch (ClassNotFoundException | SQLException e) {
            response.setStatus(400);
            request.getSession().setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }

}
