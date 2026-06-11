package com.pdc.cajaregistradora.servlets;

import java.io.IOException;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

import com.pdc.cajaregistradora.beans.ProductoCarritoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/insertarEnCarrito.jsp")
public class InsertarEnCarritoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductoCarritoBean productoCarrito = new ProductoCarritoBean();
        Integer nroCarrito = (Integer) request.getSession().getAttribute("nroCarrito");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=CajaRegistradora;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;")) {
                conn.setAutoCommit(false);

                try (CallableStatement stmt = conn.prepareCall("{CALL dbo.ins_producto_carrito(?, ?)}")) {
                    String codBarraProd = request.getParameter("codBarraProd");

                    stmt.registerOutParameter(1, Types.INTEGER);
                    if (nroCarrito != null) {
                        stmt.setInt(1, nroCarrito);
                    } else {
                        stmt.setNull(1, Types.INTEGER);
                    }
                    stmt.setString(2, codBarraProd);


                    try (ResultSet result = stmt.executeQuery()) {
                        while (result.next()) {
                            productoCarrito.setNomProducto(result.getString("nomProducto"));
                            productoCarrito.setCodBarra(result.getString("codBarra"));
                            productoCarrito.setPrecio(result.getBigDecimal("precio"));
                            productoCarrito.setNroDetalle(result.getInt("nroDetalle"));
                        }
                    }

                    nroCarrito = stmt.getInt(1);

                    conn.commit();
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }

            request.setAttribute("productoCarrito", productoCarrito);
            request.setAttribute("nroCarrito", nroCarrito);
            request.getSession().setAttribute("nroCarrito", nroCarrito);
            request.getRequestDispatcher("/components/filaProducto.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            request.getSession().setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("/components/error-modal.jsp").forward(request, response);
        }
    }

}
