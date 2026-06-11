package com.pdc.parcial3maqueta.servlets.ServletArquitectura.CallableStatement.ConTransaccion.SinResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CallableExecuteUpdateTemplateServlet extends HttpServlet {

    private static final String CONNECTION_URL = "jdbc:sqlserver://HOST:PUERTO;database=BASE;user=USUARIO;password=CLAVE;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL)) {
                conn.setAutoCommit(false);

                try (CallableStatement stmt = conn.prepareCall("{CALL dbo.NOMBRE_PROCEDIMIENTO(?,?,?)}")) {
                    stmt.setString(1, request.getParameter("parametro1"));
                    stmt.setString(2, request.getParameter("parametro2"));
                    stmt.setString(3, request.getParameter("parametro3"));

                    stmt.executeUpdate();

                    conn.commit();

                    response.setStatus(200);
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }
}
