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
import java.sql.Types;

public class CallableExecuteConSalidaTemplateServlet extends HttpServlet {

    private static final String CONNECTION_URL = "jdbc:sqlserver://HOST:PUERTO;database=BASE;user=USUARIO;password=CLAVE;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL)) {
                conn.setAutoCommit(false);

                try (CallableStatement stmt = conn.prepareCall("{CALL dbo.NOMBRE_PROCEDIMIENTO(?,?)}")) {
                    stmt.setString(1, request.getParameter("parametro1"));
                    stmt.registerOutParameter(2, Types.INTEGER);

                    stmt.execute();

                    int valorSalida = stmt.getInt(2);

                    conn.commit();

                    request.setAttribute("tipoMensaje", "success");
                    request.setAttribute("tituloMensaje", "CallableStatement + execute() + OUT");
                    request.setAttribute("mensaje", "SP con transaccion, sin ResultSet y con parametro de salida");
                    request.setAttribute("detalleMensaje", "Valor de salida: " + valorSalida);
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
