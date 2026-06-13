package ar.edu.ubp.pdc.jdbc.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import ar.edu.ubp.pdc.jdbc.beans.ProvinciaBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/provincias.jsp")
public class ProvinciasServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LinkedList<ProvinciaBean> provincias = new LinkedList<>();

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pdc;encrypt=false", "sa", "TheAlexOMG14");
				 PreparedStatement stmt = conn.prepareStatement(
						 "select cod_provincia, nom_provincia " +
							 "from dbo.provincias (nolock) " +
							 "where cod_pais = ? " +
							 "order by nom_provincia")) {
				stmt.setString(1, request.getParameter("cod_pais"));

				try (ResultSet result = stmt.executeQuery()) {
					while (result.next()) {
						ProvinciaBean provincia = new ProvinciaBean();
						provincia.setCodProvincia(result.getString("cod_provincia"));
						provincia.setNomProvincia(result.getString("nom_provincia"));
						provincias.add(provincia);
					}
				}
			}

			if (!provincias.isEmpty()) {
				request.getSession().setAttribute("provincias", provincias);
				request.getRequestDispatcher("/listado_provincias.jsp").forward(request, response);
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			response.setStatus(400);
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("/error-modal.jsp").forward(request, response);
		}
	}

}
