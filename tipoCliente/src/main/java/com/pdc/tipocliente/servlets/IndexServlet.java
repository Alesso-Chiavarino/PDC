package com.pdc.tipocliente.servlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import com.pdc.tipocliente.beans.UnidadNegocioBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index.jsp")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<UnidadNegocioBean> unidadesNegocio = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=tipoCliente;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
                 Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(
                         "select cod_unidad_negocio = '-1',\n" +
                                 "       nom_unidad_negocio = 'No informada',\n" +
                                 "       nro_orden          = 0\n" +
                                 "union all\n" +
                                 "select cod_unidad_negocio = cod_unidad_negocio,\n" +
                                 "       nom_unidad_negocio = nom_unidad_negocio,\n" +
                                 "       nro_orden          = row_number() over(order by nom_unidad_negocio)\n" +
                                 "from dbo.unidades_negocio (nolock)\n" +
                                 "order by nro_orden")) {
                while (result.next()) {
                    UnidadNegocioBean unidadNegocio = new UnidadNegocioBean();
                    unidadNegocio.setCodUnidadNegocio(result.getString("cod_unidad_negocio"));
                    unidadNegocio.setNomUnidadNegocio(result.getString("nom_unidad_negocio"));
                    unidadesNegocio.add(unidadNegocio);
                }
            }

            request.getSession().setAttribute("unidadesNegocio", unidadesNegocio);
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            response.setStatus(400);
            request.getSession().setAttribute("error", e.getMessage());
//            request.getRequestDispatcher("/error-page.jsp").forward(request, response);
        }
    }

}