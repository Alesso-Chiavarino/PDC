package com.munoz.parcialjdbc.referencia;

import com.munoz.parcialjdbc.beans.TicketsBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

/*
 * REFERENCIA: SELECT de UN solo registro con PreparedStatement.
 * - executeQuery -> porque la consulta devuelve un ResultSet
 * - rs con if (no while) -> porque se espera UN solo registro
 * - autocommit TRUE (default, no se toca) -> NO hay transacción (solo consulta) => 2 try
 */
@WebServlet("/referencia/buscarUno.jsp")
public class BuscarUnoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa", "Password1!");
                 PreparedStatement stmt = conn.prepareStatement(
                         "select asunto_ticket, texto_ticket " +
                         "  from dbo.tickets (nolock) " +
                         " where ano_ticket = ? and nro_ticket = ?")) {

                stmt.setInt(1, Integer.parseInt(req.getParameter("ano")));
                stmt.setInt(2, Integer.parseInt(req.getParameter("nro")));

                ResultSet rs = stmt.executeQuery();

                TicketsBean ticket = new TicketsBean();
                if (rs.next()) { // un solo registro esperado -> if
                    ticket.setAsunto_ticket(rs.getString("asunto_ticket"));
                    ticket.setTexto_ticket(rs.getString("texto_ticket"));
                }

                req.setAttribute("ticket", ticket);
                req.getRequestDispatcher("datos.jsp").forward(req, resp);
            }
        }
        catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }
    }
}
