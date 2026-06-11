package ar.edu.ubp.pdc.sessionscookies.cookies;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cookie.jsp")
public class CookieServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie cookie = new Cookie(request.getParameter("delAttrName"), "");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
			Cookie cookie = new Cookie(URLEncoder.encode(request.getParameter("attrName"), "UTF-8"), URLEncoder.encode(request.getParameter("attrValue"), "UTF-8"));
			//cookie.setMaxAge(24 * 60 * 60); // Duración de 1 día
			cookie.setHttpOnly(true); // Previene el acceso a la cookie desde JavaScript (protección contra XSS)
			cookie.setSecure(true); // Solo permite enviar la cookie por conexiones HTTPS
			cookie.setPath("/");
			response.addCookie(cookie);
			request.getRequestDispatcher("/ejemplo-01-data.jsp").forward(request, response);
    	}
    	catch(IllegalArgumentException | NullPointerException | ArithmeticException ex) {
    		response.setStatus(400);
    		request.getSession().setAttribute("error", ex.getMessage());
			request.getRequestDispatcher("/error-modal.jsp").forward(request, response);
    	}
	}

}
