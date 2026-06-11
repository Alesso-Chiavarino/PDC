package com.pdc.parcial3maqueta.servlets.ServletArquitectura.Statement.SinTransaccion.ConResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StatementExecuteQueryTemplateServlet extends HttpServlet {

    private static final String CONNECTION_URL = "jdbc:sqlserver://HOST:PUERTO;database=BASE;user=USUARIO;password=CLAVE;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL);
                 Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(
                         "select codigo, descripcion, detalle, estado " +
                                 "from dbo.NOMBRE_TABLA " +
                                 "order by codigo")) {

                while (result.next()) {
                    // Si devuelve muchos registros, usar while.
                    // Si devuelve uno solo, usar if.
                    // Mapear aca el resultSet segun el parcial.
                }
            }

            request.setAttribute("tipoMensaje", "success");
            request.setAttribute("tituloMensaje", "Statement + executeQuery()");
            request.setAttribute("mensaje", "Consulta sin transaccion y con ResultSet");
            request.setAttribute("detalleMensaje", "Usar while(...) o if(...) segun la cantidad de filas");
            request.getRequestDispatcher("/components/mensajeOperacion.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }
}
