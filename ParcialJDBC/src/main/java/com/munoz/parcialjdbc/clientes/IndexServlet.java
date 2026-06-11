package com.munoz.parcialjdbc.clientes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import com.munoz.parcialjdbc.beans.UnidadesBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes/index.jsp")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<UnidadesBean> unidades = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa", "Password1!");
                 Statement stmt = conn.createStatement();
                 ResultSet result = stmt.executeQuery(
                         "select cod_unidad_negocio = '-1',\n" +
                                 "       nom_unidad_negocio = 'No informada',\n" +
                                 "\t   nro_orden          = 0\n" +
                                 " union all\n" +
                                 "select cod_unidad_negocio = cod_unidad_negocio,\n" +
                                 "       nom_unidad_negocio = nom_unidad_negocio,\n" +
                                 "\t   nro_orden          = row_number() over(order by nom_unidad_negocio)\n" +
                                 "  from dbo.unidades_negocio (nolock)\n" +
                                 " order by nro_orden")) {

                while (result.next()) {
                    UnidadesBean unidad = new UnidadesBean();
                    unidad.setCod_unidad_negocio(result.getString("cod_unidad_negocio"));
                    unidad.setNom_unidad_negocio(result.getString("nom_unidad_negocio"));
                    unidad.setNro_orden(result.getInt("nro_orden"));
                    unidades.add(unidad);
                }
            }

            request.getSession().setAttribute("unidades", unidades);
            request.getRequestDispatcher("/clientes/listado.jsp").forward(request, response);
        }
        catch (ClassNotFoundException | SQLException e) {
            response.setStatus(400);
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error-page.jsp").forward(request, response);
        }
    }

}
