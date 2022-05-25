package immo.portal.servlets;

import java.io.IOException;

import javax.sql.DataSource;

import data.GebotData;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GebotServlet")
public class GebotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(lookup = "java:jboss/datasources/MySqlweb_db_ttsDS")
	private DataSource dataSource;	
	private HttpSession session;
	private GebotData gebotData;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.gebotData = new GebotData(dataSource);
		session = request.getSession();
		
		session.setAttribute("GebotZuNiedrig", false);
		session.setAttribute("GebotIstOk", false);
		
		if (request.getParameter("gebot_absenden") != null) {
			Integer gebot = (Integer.valueOf(request.getParameter("gebot")));
			String id = request.getParameter("gebot_absenden");
			Integer benutzerid = (Integer.valueOf(request.getParameter("benutzer")));
			
			if (gebot < 0) {
				return;	
			}
			if(gebotData.istGebotZuKlein(gebot, id)) {
				session.setAttribute("GebotZuNiedrig", true);
			}
			if(gebotData.istGebotOk(gebot, id)) {		
				gebotData.gebotAktualisieren(gebot, id, benutzerid);
				session.setAttribute("GebotIstOk", true);
			}
		}

		response.sendRedirect("html/geboterfolgreich.html");
}
}