package ar.edu.ubp.pdc.sessionscookies.sessions;

import java.io.IOException;
import java.net.URLEncoder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/session.jsp")
public class SessionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(true);   
		session.removeAttribute(request.getParameter("delAttrName"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		HttpSession session = request.getSession();
    		session.setAttribute(URLEncoder.encode(request.getParameter("attrName"), "UTF-8"), URLEncoder.encode(request.getParameter("attrValue"), "UTF-8"));
			request.getRequestDispatcher("/ejemplo-02-data.jsp").forward(request, response);
    	}
    	catch(IllegalArgumentException | NullPointerException ex) {
    		response.setStatus(400);
    		request.getSession().setAttribute("error", ex.getMessage());
			request.getRequestDispatcher("/error-modal.jsp").forward(request, response);    	}
	}

}
