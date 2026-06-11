package com.pdc.parcial3maqueta.servlets.ServletArquitecturaLlena.PreparedStatement.SinTransaccion.ConResultSet;

import com.pdc.parcial3maqueta.beans.ResultadoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

@WebServlet("/preparedConsulta.jsp")
public class PreparedExecuteQueryServlet extends HttpServlet {

    private static final String CONNECTION_URL =
            "jdbc:sqlserver://pdc-server.database.windows.net:1433;database=PDC;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<ResultadoBean> items = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection(CONNECTION_URL);
                 PreparedStatement stmt = conn.prepareStatement(
                         "select codigo      = t.codigo, " +
                                 "       descripcion = t.descripcion, " +
                                 "       detalle     = t.detalle, " +
                                 "       estado      = t.estado " +
                                 "from dbo.mi_tabla t " +
                                 "where t.descripcion like '%' + isnull(ltrim(rtrim(?)), '') + '%' " +
                                 "order by case ? " +
                                 "           when 'C' then t.codigo " +
                                 "           when 'D' then t.descripcion " +
                                 "           else t.estado " +
                                 "         end")) {
                String textoBusqueda = request.getParameter("textoBusqueda");
                String orden = request.getParameter("orden");

                stmt.setString(1, textoBusqueda);
                stmt.setString(2, orden);

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

            request.setAttribute("tituloTabla", "PreparedStatement + executeQuery()");
            request.setAttribute("items", items);
            request.getRequestDispatcher("/components/resultadosTabla.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }
}
