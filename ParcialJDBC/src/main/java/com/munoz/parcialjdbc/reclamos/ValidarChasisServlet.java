package com.munoz.parcialjdbc.reclamos;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/reclamos/validarChasis.jsp")

public class ValidarChasisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa","Password1!");
                 CallableStatement stmt = conn.prepareCall("{call dbo.val_vehiculo(?,?,?)}")) {
                String patente = req.getParameter("patente");

                stmt.setString(1, req.getParameter("nroChasis"));
                if (patente != null && !patente.isEmpty())
                    stmt.setString(2, patente);
                else
                    stmt.setNull(2, Types.VARCHAR);
                stmt.registerOutParameter(3, Types.CHAR);

                stmt.execute();

                String existe = stmt.getString(3);

                req.setAttribute("existe", existe);
                req.getRequestDispatcher("validar.jsp").forward(req, resp);

            }

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }


    }
}
