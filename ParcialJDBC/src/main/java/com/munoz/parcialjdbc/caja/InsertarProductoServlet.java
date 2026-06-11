package com.munoz.parcialjdbc.caja;

import com.munoz.parcialjdbc.beans.ProductoBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/caja/insertarProducto.jsp")
public class InsertarProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa", "Password1!")) {
                conn.setAutoCommit(false);
                try (CallableStatement stmt = conn.prepareCall("{call dbo.ins_producto_carrito(?,?)}")) {

                    // @nro_carrito es INPUT/OUTPUT integer -> registro el out y seteo el in
                    stmt.registerOutParameter(1, Types.INTEGER);

                    String nroCarrito = req.getParameter("nro_carrito");
                    if (nroCarrito != null && !nroCarrito.isEmpty())
                        stmt.setInt(1, Integer.parseInt(nroCarrito));
                    else
                        stmt.setNull(1, Types.INTEGER);

                    stmt.setString(2, req.getParameter("cod_barra"));

                    // UNA sola llamada: el SP hace los inserts y devuelve el ResultSet con los datos del producto
                    ResultSet rs = stmt.executeQuery();

                    ProductoBean producto = new ProductoBean();
                    if (rs.next()) { // el SP devuelve UN registro -> if
                        producto.setNroDetalle(rs.getInt("nroDetalle"));
                        producto.setCodBarra(rs.getString("codBarra"));
                        producto.setNomProducto(rs.getString("nomProducto"));
                        producto.setPrecio(rs.getFloat("precio"));
                    }

                    // Leo el OUT después del ResultSet (SQL Server lo popula al final)
                    int nroCarritoOut = stmt.getInt(1);

                    conn.commit();

                    req.setAttribute("producto", producto);
                    req.setAttribute("nroCarrito", nroCarritoOut); // para que el JSP/JS lo persista
                    req.getRequestDispatcher("producto.jsp").forward(req, resp);
                }
                catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }
    }
}