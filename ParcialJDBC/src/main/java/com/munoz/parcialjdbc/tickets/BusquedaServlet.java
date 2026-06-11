package com.munoz.parcialjdbc.tickets;

import com.munoz.parcialjdbc.beans.TicketsBean;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/tickets/buscar.jsp")

public class BusquedaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1435;databaseName=pdc;encrypt=false", "sa","Password1!");
                 PreparedStatement stmt = conn.prepareStatement(
                         "select ticket        = convert(varchar(4), t.ano_ticket) + '-' + replicate('0', 5 - len(convert(varchar(5), t.nro_ticket))) + convert(varchar(5), t.nro_ticket),\n" +
                         "       fecha_ticket  = convert(varchar(10), t.fecha_ticket, 103) + ' ' + convert(varchar(5), t.fecha_ticket, 108), \n" +
                         "\t   solicitante   = s.nom_solicitante,\n" +
                         "\t   asunto_ticket = t.asunto_ticket,\n" +
                         "\t   texto_ticket  = t.texto_ticket\n" +
                         "  from dbo.tickets t (nolock)\n" +
                         "       join dbo.solicitantes s (nolock)\n" +
                         "\t     on t.nro_solicitante = s.nro_solicitante\n" +
                         " where (t.asunto_ticket   like '%' + isnull(ltrim(rtrim(?)), '') + '%'\n" +
                         "    or  t.texto_ticket    like '%' + isnull(ltrim(rtrim(?)), '') + '%'\n" +
                         "  \tor  s.nom_solicitante like '%' + isnull(ltrim(rtrim(?)), '') + '%')\n" +
                         " order by case ?\n" +
                         "               when 'F'\n" +
                         "\t\t\t   then convert(varchar(10), t.fecha_ticket, 112) + ' ' + convert(varchar(5), t.fecha_ticket, 108)\n" +
                         "\t\t\t   when 'S'\n" +
                         "\t\t\t   then s.nom_solicitante\n" +
                         "\t\t\t   when 'T'\n" +
                         "\t\t\t   then convert(varchar(4), t.ano_ticket) + '-' + replicate('0', 5 - len(convert(varchar(5), t.nro_ticket))) + convert(varchar(5), t.nro_ticket)\n" +
                         "\t\t end")) {

                // getParameter lee el POST body; getAttribute cubre el caso de forward desde NuevoServlet
                String busqueda = req.getParameter("busqueda") != null ? req.getParameter("busqueda") : (String) req.getAttribute("busqueda");
                String orden    = req.getParameter("orden")    != null ? req.getParameter("orden")    : (String) req.getAttribute("orden");

                stmt.setString(1, busqueda);
                stmt.setString(2, busqueda);
                stmt.setString(3, busqueda);
                stmt.setString(4, orden);

                ResultSet rs = stmt.executeQuery();
//              hago executeQuery, porque es un select que retorna un resultSet

                List<TicketsBean> tickets = new ArrayList<>();
//                Creo un listado porque el resultset es mas de un registro lo que se devuelve y lo recorro con while
                while (rs.next()) {
                    TicketsBean ticket = new TicketsBean();
                    ticket.setTicket(rs.getString("ticket"));
                    ticket.setFecha_ticket(rs.getString("fecha_ticket"));
                    ticket.setSolicitante(rs.getString("solicitante"));
                    ticket.setAsunto_ticket(rs.getString("asunto_ticket"));
                    ticket.setTexto_ticket(rs.getString("texto_ticket"));
                    tickets.add(ticket);
                }
//                Meto ese listado y se lo paso a datos.jsp, que debo recorrerlo con c:foreach
                req.setAttribute("tickets", tickets);
                req.getRequestDispatcher("datos.jsp").forward(req, resp);
            }

        } catch (ClassNotFoundException | SQLException e) {
            resp.setStatus(400);
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/error-modal.jsp").forward(req, resp);
        }
    }
}
