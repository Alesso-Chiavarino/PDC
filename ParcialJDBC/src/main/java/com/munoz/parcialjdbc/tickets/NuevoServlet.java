package com.munoz.parcialjdbc.tickets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/tickets/cargar.jsp")
public class NuevoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try(Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa","Password1!")) {
                conn.setAutoCommit(false);
                try(CallableStatement stmt = conn.prepareCall("{call dbo.ins_ticket(?,?,?,?)}")){
//                    Llamo al procedimiento con autocommit false, para poder manejar bien la insercion con los errores por las dudas
                    stmt.setString(1, req.getParameter("asunto"));
                    stmt.setString(2, req.getParameter("texto"));
                    stmt.setString(3, req.getParameter("solicitante"));
                    stmt.setString(4, req.getParameter("correo"));

                    stmt.executeUpdate();
                    conn.commit();

//                    No tengo que devolver ningun result set, porque el procedimiento no me lo devuelve. lo que hago es redirigir a busqueda
//                    que es el jsp que contiene la informacion

                    // Redirige al listado completo ordenado por fecha tras el insert
                    req.setAttribute("busqueda", "");
                    req.setAttribute("orden", "F");
                    req.getRequestDispatcher("buscar.jsp").forward(req, resp);
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
