package com.pdc.tipocliente.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/actualizarSubtiposCliente.jsp")
public class ActualizarSubtiposClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=tipoCliente;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
                 PreparedStatement stmt = conn.prepareStatement(
                         "update sc\n" +
                                 "set habilitado = ?\n" +
                                 "from dbo.subtipos_clientes sc\n" +
                                 "where cod_tipo_cliente = ?\n" +
                                 "  and nro_subtipo = ?")) {

                conn.setAutoCommit(false);

                try {
                    String[] habilitados = request.getParameterValues("habilitado");
                    String[] codigos = request.getParameterValues("codTipoCliente");
                    String[] subtipos = request.getParameterValues("nroSubtipo");

                    if (habilitados == null || codigos == null || subtipos == null
                            || habilitados.length != codigos.length || codigos.length != subtipos.length) {
                        throw new SQLException("Los datos enviados para actualizar son invalidos.");
                    }

                    for (int i = 0; i < codigos.length; i++) {
                        stmt.setString(1, habilitados[i]);
                        stmt.setString(2, codigos[i]);
                        stmt.setInt(3, Integer.parseInt(subtipos[i]));
                        stmt.executeUpdate();
                    }

                    conn.commit();

                    response.setStatus(HttpServletResponse.SC_OK);
                    response.setContentType("text/plain;charset=UTF-8");
                    response.getWriter().write("OK");
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(ex.getMessage());
        }
    }
}
