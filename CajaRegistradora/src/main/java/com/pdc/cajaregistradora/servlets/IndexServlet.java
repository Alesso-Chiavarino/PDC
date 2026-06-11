package com.pdc.cajaregistradora.servlets;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.*;
import java.util.LinkedList;

import com.pdc.cajaregistradora.beans.ProductoCarritoBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index.jsp")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<ProductoCarritoBean> carrito = new LinkedList<>();
        Integer nroCarrito = (Integer) request.getSession().getAttribute("nroCarrito");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=CajaRegistradora;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");
                 PreparedStatement stmt = conn.prepareStatement(
                         "select nroDetalle  = d.nro_detalle,\n" +
                                 "       codBarra    = p.cod_barra,\n" +
                                 "       nomProducto = p.nom_producto,\n" +
                                 "       precio      = p.precio\n" +
                                 "from dbo.detalle_carritos d (nolock)\n" +
                                 "         join dbo.productos p (nolock)\n" +
                                 "              on d.nro_producto = p.nro_producto\n" +
                                 "where d.nro_carrito = ?\n" +
                                 "order by d.fecha_hora_registro")) {

                if (nroCarrito == null) {
                    stmt.setNull(1, Types.INTEGER);
                } else {
                    stmt.setInt(1, nroCarrito);
                }


                try (ResultSet result = stmt.executeQuery()) {
                    while (result.next()) {
                        ProductoCarritoBean productoCarrito = new ProductoCarritoBean();
                        productoCarrito.setNomProducto(result.getString("nomProducto"));
                        productoCarrito.setCodBarra(result.getString("codBarra"));
                        productoCarrito.setPrecio(result.getBigDecimal("precio"));
                        productoCarrito.setNroDetalle(result.getInt("nroDetalle"));
                        carrito.add(productoCarrito);
                    }
                }
            }

            if (!carrito.isEmpty()) {
                request.getSession().setAttribute("carrito", carrito);
            }

            request.getRequestDispatcher("/main.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            response.setStatus(400);
            request.getSession().setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/pages/error-page.jsp").forward(request, response);
        }
    }

}
