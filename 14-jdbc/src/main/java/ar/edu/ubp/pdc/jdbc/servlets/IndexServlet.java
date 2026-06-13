package ar.edu.ubp.pdc.jdbc.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import ar.edu.ubp.pdc.jdbc.beans.PaisBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/index.jsp")
public class IndexServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LinkedList<PaisBean> paises = new LinkedList<>();

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

				try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pdc;encrypt=false", "sa", "TheAlexOMG14");
				 Statement stmt = conn.createStatement();
				 ResultSet result = stmt.executeQuery(
						 "select cod_pais, nom_pais " +
							 "from dbo.paises (nolock) " +
							 "order by nom_pais")) {
				while (result.next()) {
					PaisBean pais = new PaisBean();
					pais.setCodPais(result.getString("cod_pais"));
					pais.setNomPais(result.getString("nom_pais"));
					paises.add(pais);
				}
			}

			request.getSession().setAttribute("paises", paises);
			request.getRequestDispatcher("/listado_paises.jsp").forward(request, response);
		}
		catch (ClassNotFoundException | SQLException e) {
			response.setStatus(400);
			request.getSession().setAttribute("error", e.getMessage());
			request.getRequestDispatcher("/error-page.jsp").forward(request, response);
		}
	}

}
