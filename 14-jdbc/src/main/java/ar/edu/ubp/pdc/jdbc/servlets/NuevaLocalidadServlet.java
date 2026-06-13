package ar.edu.ubp.pdc.jdbc.servlets;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/nueva_localidad.jsp")
public class NuevaLocalidadServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			try (Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=pdc;encrypt=false", "sa", "TheAlexOMG14")) {

				conn.setAutoCommit(false); //Habilito control transaccional

				try (CallableStatement stmt = conn.prepareCall("{CALL dbo.ins_localidad(?,?,?,?)}")) {
					stmt.setString(1, request.getParameter("nom_localidad"));
					stmt.setString(2, request.getParameter("cod_pais"));

					String codProvincia = request.getParameter("cod_provincia");
					if (codProvincia == null || codProvincia.isEmpty()) {
						stmt.setNull(3, java.sql.Types.VARCHAR);
					} else {
						stmt.setString(3, codProvincia);
					}

					stmt.registerOutParameter(4, java.sql.Types.INTEGER);
					stmt.executeUpdate();

					request.getSession().setAttribute("nro_localidad", stmt.getInt(4));

					conn.commit();
					request.getRequestDispatcher("/localidad.jsp").forward(request, response);
				}
				catch (SQLException ex) {
					conn.rollback();
					throw ex;
				}
			}

		}
		catch (ClassNotFoundException | SQLException ex) {
			response.setStatus(400);
			request.getSession().setAttribute("error", ex.getMessage());
			request.getRequestDispatcher("/error-modal.jsp").forward(request, response);
		}
	}

}
