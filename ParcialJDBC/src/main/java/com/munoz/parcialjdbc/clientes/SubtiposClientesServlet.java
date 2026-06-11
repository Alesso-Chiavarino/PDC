package com.munoz.parcialjdbc.clientes;

import com.munoz.parcialjdbc.beans.SubtiposClientesBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/clientes/subtiposclientes.jsp")

public class SubtiposClientesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa","Password1!");
                 CallableStatement stmt = conn.prepareCall("{call dbo.get_subtipos_clientes(?)}")) {
                stmt.setString(1,req.getParameter("cod_unidad_negocio"));
//                  Me conecto a la base y llamo el proced pasandole los parametros. ahora, tengo que ejecutarlo
//                  Llamo al procedimiendo en la ejecucion, en este caso executeQuery porque tiene result set
                ResultSet rs = stmt.executeQuery();


                List<SubtiposClientesBean> subtiposClientes = new ArrayList<>();

                while (rs.next()) {
                    SubtiposClientesBean subtipos = new SubtiposClientesBean();
                    subtipos.setNro_subtipo(rs.getInt("nro_subtipo"));
                    subtipos.setHabilitado(rs.getString("habilitado"));
                    subtipos.setCod_tipo_cliente(rs.getString("cod_tipo_cliente"));
                    subtipos.setNom_tipo_cliente(rs.getString("nom_tipo_cliente"));
                    subtiposClientes.add(subtipos);
                }

                req.setAttribute("subtipos", subtiposClientes);
                req.getRequestDispatcher("clientes.jsp").forward(req, resp);

            }

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }


    }
}
