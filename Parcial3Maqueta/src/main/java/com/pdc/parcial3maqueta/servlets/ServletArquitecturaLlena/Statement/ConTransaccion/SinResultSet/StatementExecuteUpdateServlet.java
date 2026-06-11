package com.pdc.parcial3maqueta.servlets.ServletArquitecturaLlena.Statement.ConTransaccion.SinResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/statementActualizacion.jsp")
public class StatementExecuteUpdateServlet extends HttpServlet {

    private static final String CONNECTION_URL =
            "jdbc:sqlserver://pdc-server.database.windows.net:1433;database=PDC;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL);
                 Statement stmt = conn.createStatement()) {
                conn.setAutoCommit(false);

                try {
                    int filasAfectadas = stmt.executeUpdate(
                            "update dbo.mi_tabla " +
                                    "set estado = 'S' " +
                                    "where codigo = 'A1'");

                    request.setAttribute("tipoMensaje", "success");
                    request.setAttribute("tituloMensaje", "Statement + executeUpdate()");
                    request.setAttribute("mensaje", "Ejemplo sin ResultSet.");
                    request.setAttribute("detalleMensaje", "Filas afectadas: " + filasAfectadas);

                    conn.commit();
                    request.getRequestDispatcher("/components/mensajeOperacion.jsp").forward(request, response);
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
