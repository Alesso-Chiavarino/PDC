package com.pdc.tipocliente.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.pdc.tipocliente.beans.SubtipoClienteBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/buscarSubtipoCliente.jsp")
public class BuscarSubtipoClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SubtipoClienteBean> subtiposClienteBean = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=tipoCliente;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;")) {


                try (CallableStatement stmt = conn.prepareCall("{CALL dbo.get_subtipos_clientes(?)}")) {
                    String unidadNegocio = request.getParameter("unidadNegocio");


                    if ("-1".equals(unidadNegocio)) {
                        stmt.setNull(1, java.sql.Types.VARCHAR);
                    } else {
                        stmt.setString(1, unidadNegocio);
                    }

                    try (ResultSet result = stmt.executeQuery()) {
                        while (result.next()) {
                            SubtipoClienteBean subtipoCliente = new SubtipoClienteBean();
                            subtipoCliente.setCodTipoCliente(result.getString("cod_tipo_cliente"));
                            subtipoCliente.setNroSubtipo(result.getInt("nro_subtipo"));
                            subtipoCliente.setNomTipoCliente(result.getString("nom_tipo_cliente"));
                            subtipoCliente.setHabilitado(result.getString("habilitado"));

                            subtiposClienteBean.add(subtipoCliente);
                        }
                    }


                }
            }

            request.setAttribute("subtiposClienteBean", subtiposClienteBean);
            request.getRequestDispatcher("/components/subtiposClientesTabla.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(ex.getMessage());
        }
    }

}
