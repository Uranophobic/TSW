package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DatiSpedizione;
import bean.Utente;
import model.DatiSpedizioneModel;
import modelDS.DatiSpedizioneModelDS;


/**
 * Servlet implementation class provaDsDp
 */
@WebServlet("/provaDsDp")
public class provaDsDp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    DatiSpedizione ds = new DatiSpedizione();
    Utente utente = new Utente();
    static DatiSpedizioneModel model = new DatiSpedizioneModelDS();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			
			


				String via = request.getParameter("via");
				String citta = request.getParameter("citta");
				String provincia = request.getParameter("provincia");
				int cap = Integer.parseInt(request.getParameter("cap"));
				//String email = request.getParameter("email");
				
				try {
					ds = model.doRetrieveByKey(utente.getEmail());
					
					if(ds != null ) {
						System.out.println("ds: " + ds);
					}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
			
			request.getSession().setAttribute("utenteSessione", utente);
			request.getSession().setAttribute("dsSessione", ds);
			
			response.sendRedirect("dsprova.jsp");
			
		
	}

}
