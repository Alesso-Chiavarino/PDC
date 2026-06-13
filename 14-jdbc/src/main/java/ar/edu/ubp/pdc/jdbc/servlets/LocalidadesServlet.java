package ar.edu.ubp.pdc.jdbc.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import ar.edu.ubp.pdc.jdbc.beans.LocalidadBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/localidades.jsp")
public class LocalidadesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LinkedList<LocalidadBean> localidades = new LinkedList<>();

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pdc;encrypt=false", "sa", "TheAlexOMG14");
				 CallableStatement stmt = conn.prepareCall("{CALL dbo.get_localidades(?, ?)}")) {
				stmt.setString(1, request.getParameter("cod_pais"));

				String codProvincia = request.getParameter("cod_provincia");
				if (codProvincia == null || codProvincia.isEmpty()) {
					stmt.setNull(2, java.sql.Types.VARCHAR);
				}
				else {
					stmt.setString(2, codProvincia);
				}

				try (ResultSet result = stmt.executeQuery()) {
					while (result.next()) {
						LocalidadBean localidad = new LocalidadBean();
						localidad.setNroLocalidad(result.getInt("nro_localidad"));
						localidad.setNomLocalidad(result.getString("nom_localidad"));
						localidades.add(localidad);
					}
				}
			}

			request.getSession().setAttribute("localidades", localidades);
			request.getRequestDispatcher("/listado_localidades.jsp").forward(request, response);
		}
		catch (ClassNotFoundException | SQLException ex) {
			response.setStatus(400);
			request.getSession().setAttribute("error", ex.getMessage());
			request.getRequestDispatcher("/error-modal.jsp").forward(request, response);
		}
	}

}
