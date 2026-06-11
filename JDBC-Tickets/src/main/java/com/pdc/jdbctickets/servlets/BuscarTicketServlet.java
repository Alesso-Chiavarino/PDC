package com.pdc.jdbctickets.servlets;

import com.pdc.jdbctickets.beans.TicketBean;
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

@WebServlet("/buscarTicket.jsp")
public class BuscarTicketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LinkedList<TicketBean> tickets = new LinkedList<>();

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");


            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=tickets;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;");

                 PreparedStatement stmt = conn.prepareStatement(
                         "select ticket        = convert(varchar(4), t.ano_ticket) + '-' + replicate('0', 5 - len(convert(varchar(5), t.nro_ticket))) + convert(varchar(5), t.nro_ticket),\n" +
                                 "       fecha_ticket  = convert(varchar(10), t.fecha_ticket, 103) + ' ' + convert(varchar(5), t.fecha_ticket, 108),\n" +
                                 "       solicitante   = s.nom_solicitante,\n" +
                                 "       asunto_ticket = t.asunto_ticket,\n" +
                                 "       texto_ticket  = t.texto_ticket\n" +
                                 "from dbo.tickets t (nolock)\n" +
                                 "         join dbo.solicitantes s (nolock)\n" +
                                 "              on t.nro_solicitante = s.nro_solicitante\n" +
                                 "where (t.asunto_ticket   like '%' + isnull(ltrim(rtrim(?)), '') + '%'\n" +
                                 "    or  t.texto_ticket    like '%' + isnull(ltrim(rtrim(?)), '') + '%'\n" +
                                 "    or  s.nom_solicitante like '%' + isnull(ltrim(rtrim(?)), '') + '%')\n" +
                                 "order by case ?\n" +
                                 "             when 'F'\n" +
                                 "                 then convert(varchar(10), t.fecha_ticket, 112) + ' ' + convert(varchar(5), t.fecha_ticket, 108)\n" +
                                 "             when 'S'\n" +
                                 "                 then s.nom_solicitante\n" +
                                 "             when 'T'\n" +
                                 "                 then convert(varchar(4), t.ano_ticket) + '-' + replicate('0', 5 - len(convert(varchar(5), t.nro_ticket))) + convert(varchar(5), t.nro_ticket)\n" +
                                 "             end")) {
                stmt.setString(1, request.getParameter("textoBusqueda"));
                stmt.setString(2, request.getParameter("textoBusqueda"));
                stmt.setString(3, request.getParameter("textoBusqueda"));
                stmt.setString(4, request.getParameter("orden"));

                try (ResultSet result = stmt.executeQuery()) {
                    while (result.next()) {
                        TicketBean ticket = new TicketBean();
                        ticket.setAsunto_ticket(result.getString("asunto_ticket"));
                        ticket.setFecha_ticket(result.getString("fecha_ticket"));
                        ticket.setNro_ticket(result.getString("ticket"));
                        ticket.setTexto_ticket(result.getString("texto_ticket"));
                        ticket.setNro_solicitante(result.getString("solicitante"));
                        tickets.add(ticket);
                    }
                }


            }


            request.getSession().setAttribute("tickets", tickets);
            request.getRequestDispatcher("/components/ticketsTabla.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(ex.getMessage());
        }
    }

}
