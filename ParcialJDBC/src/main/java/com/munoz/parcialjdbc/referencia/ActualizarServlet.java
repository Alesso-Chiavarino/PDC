package com.munoz.parcialjdbc.referencia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

/*
 * REFERENCIA: UPDATE con PreparedStatement + parámetros.
 * - executeUpdate -> porque es un UPDATE (no devuelve ResultSet, devuelve cant. de filas afectadas)
 * - autocommit FALSE -> porque hay transacción (insert/update/delete) => estructura de 3 try:
 *      try externo (driver) -> try connection (setAutoCommit(false)) -> try statement (commit / catch rollback)
 */
@WebServlet("/referencia/actualizar.jsp")
public class ActualizarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa", "Password1!")) {
                conn.setAutoCommit(false);
                try (PreparedStatement stmt = conn.prepareStatement(
                        "update dbo.reclamos set km = ?, telefono = ? where nro_reclamo = ?")) {

                    stmt.setInt(1, Integer.parseInt(req.getParameter("km")));

                    // Parámetro opcional: si viene vacío, mando NULL
                    String telefono = req.getParameter("telefono");
                    if (telefono != null && !telefono.isEmpty())
                        stmt.setString(2, telefono);
                    else
                        stmt.setNull(2, Types.VARCHAR);

                    stmt.setInt(3, Integer.parseInt(req.getParameter("nro_reclamo")));

                    int filas = stmt.executeUpdate(); // executeUpdate devuelve cant. de filas afectadas
                    conn.commit();

                    req.setAttribute("mensaje", "Filas actualizadas: " + filas);
                    req.getRequestDispatcher("mensaje.jsp").forward(req, resp);
                }
                catch (SQLException ex) {
                    conn.rollback(); // si algo falla, deshago la transacción
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
