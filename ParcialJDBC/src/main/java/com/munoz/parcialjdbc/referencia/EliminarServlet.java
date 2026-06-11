package com.munoz.parcialjdbc.referencia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

/*
 * REFERENCIA: DELETE con PreparedStatement + parámetro.
 * - executeUpdate -> porque es un DELETE (no devuelve registros)
 * - autocommit FALSE -> hay transacción => 3 try (externo / connection / statement con commit-rollback)
 */
@WebServlet("/referencia/eliminar.jsp")
public class EliminarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa", "Password1!")) {
                conn.setAutoCommit(false);
                try (PreparedStatement stmt = conn.prepareStatement(
                        "delete from dbo.reclamos where nro_reclamo = ?")) {

                    stmt.setInt(1, Integer.parseInt(req.getParameter("nro_reclamo")));

                    int filas = stmt.executeUpdate();
                    conn.commit();

                    req.setAttribute("mensaje", "Filas eliminadas: " + filas);
                    req.getRequestDispatcher("mensaje.jsp").forward(req, resp);
                }
                catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }
    }
}
