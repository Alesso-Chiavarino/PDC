package com.pdc.jdbctickets.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/nuevoTicket.jsp")
public class NuevoTicketServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://pdc-server.database.windows.net:1433;database=tickets;user=sqladmin@pdc-server;password=SqlServer123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;")) {

                conn.setAutoCommit(false);

                try (CallableStatement stmt = conn.prepareCall("{CALL dbo.ins_ticket(?,?,?,?)}")) {
                    stmt.setString(1, request.getParameter("asunto"));
                    stmt.setString(2, request.getParameter("texto"));
                    stmt.setString(3, request.getParameter("solicitante"));
                    stmt.setString(4, request.getParameter("email"));

                    stmt.executeUpdate();


                    conn.commit();
                    response.setStatus(201);
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            }

        } catch (ClassNotFoundException | SQLException ex) {
            response.setStatus(400);
            response.setContentType("text/plain;charset=UTF-8");
            response.getWriter().write(ex.getMessage());
        }
    }

}
