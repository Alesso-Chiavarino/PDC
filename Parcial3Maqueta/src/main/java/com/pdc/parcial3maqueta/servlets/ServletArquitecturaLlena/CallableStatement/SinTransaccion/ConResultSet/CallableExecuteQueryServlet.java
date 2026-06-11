package com.pdc.parcial3maqueta.servlets.ServletArquitecturaLlena.CallableStatement.SinTransaccion.ConResultSet;

import com.pdc.parcial3maqueta.beans.ResultadoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedList;

@WebServlet("/callableConsulta.jsp")
public class CallableExecuteQueryServlet extends HttpServlet {

    private static final String CONNECTION_URL =
            "jdbc:sqlserver://pdc-server.database.windows.net:1433;database=PDC;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<ResultadoBean> items = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL);
                 CallableStatement stmt = conn.prepareCall("{CALL dbo.mi_procedimiento_consulta(?)}")) {

                String codigo = request.getParameter("codigo");
                if (codigo == null || codigo.trim().isEmpty()) {
                    stmt.setNull(1, Types.VARCHAR);
                } else {
                    stmt.setString(1, codigo);
                }

                try (ResultSet result = stmt.executeQuery()) {
                    while (result.next()) {
                        ResultadoBean item = new ResultadoBean();
                        item.setCodigo(result.getString("codigo"));
                        item.setDescripcion(result.getString("descripcion"));
                        item.setDetalle(result.getString("detalle"));
                        item.setEstado(result.getString("estado"));
                        items.add(item);
                    }
                }
            }

            request.setAttribute("tituloTabla", "CallableStatement + executeQuery()");
            request.setAttribute("items", items);
            request.getRequestDispatcher("/components/resultadosTabla.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }
}
