package com.munoz.parcialjdbc.reclamos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/reclamos/enviar.jsp")
public class RegistrarReclamoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa","Password1!")) {
                conn.setAutoCommit(false);
                try(PreparedStatement stmt = conn.prepareStatement(
                        "insert into dbo.reclamos(nro_chasis, dominio, km, apellido, nombre, email, telefono, contactar, reclamo) " +
                        "values(?, ?, ?, ?, ?, ?, ?, ?, ?)")){

                    String nroChasis  = req.getParameter("nroChasis");
                    String patente    = req.getParameter("patente");
                    String kilometros = req.getParameter("kilometros");
                    String telefono   = req.getParameter("telefono");

                    if (nroChasis != null && !nroChasis.isEmpty())
                        stmt.setString(1, nroChasis);
                    else
                        stmt.setNull(1, Types.VARCHAR);

                    if (patente != null && !patente.isEmpty())
                        stmt.setString(2, patente);
                    else
                        stmt.setNull(2, Types.VARCHAR);

                    if (kilometros != null && !kilometros.isEmpty())
                        stmt.setInt(3, Integer.parseInt(kilometros));
                    else
                        stmt.setNull(3, Types.INTEGER);

                    stmt.setString(4, req.getParameter("apellido"));
                    stmt.setString(5, req.getParameter("nombre"));
                    stmt.setString(6, req.getParameter("email"));

                    if (telefono != null && !telefono.isEmpty())
                        stmt.setString(7, telefono);
                    else
                        stmt.setNull(7, Types.VARCHAR);

                    stmt.setString(8, req.getParameter("contactar"));
                    stmt.setString(9, req.getParameter("reclamo"));

                    stmt.executeUpdate();
                    conn.commit();

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
