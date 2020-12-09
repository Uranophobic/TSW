package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Utente;
import bean.Ordine;
import model.OrdineModel;
import model.UtenteModel;
import modelDS.OrdineModelDS;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class ProfiloUtenteServlet
 */
@WebServlet("/ProfiloUtenteServlet")
public class ProfiloUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static OrdineModel ordineModel = new OrdineModelDS();
	static UtenteModel utenteModel = new UtenteModelDS();
	Utente utente = new Utente();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfiloUtenteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		getServletContext().getRequestDispatcher("/view/profiloUtente.jsp").forward(request, response);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneProfilo = request.getParameter("azioneProfilo");
		
		if(azioneProfilo!=null) {
			switch (azioneProfilo) {
			case "visualizzaProfilo":
				
				utente = (Utente) request.getSession().getAttribute("utenteSessione");
				//gestire sessione
				
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String nome = request.getParameter("nome");
				String cognome = request.getParameter("cognome");
				String dataDiNascita = request.getParameter("dataDiNascita");
				
				utente.setEmail(email);
				utente.setPassword(password);
				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setDataDiNascita(dataDiNascita);
				
				//ci va anche indirizzo e pagamento
				
				
				break;
			
			case "visualizzaWishList":
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("wishlist.jsp");
				
				break;
				
			case "visualizzaOrdini":

				 utente = (Utente) request.getSession().getAttribute("utenteSessione");
				 ArrayList<Ordine> ordiniUtente = new ArrayList<Ordine>();
				 try {
					ArrayList<Ordine> ordiniTotali = ordineModel.doRetrieveAll("idOrdine");

					 for (Ordine o: ordiniTotali) {
						 if(o.getEmailUtente().equals(utente.getEmail())) {
							 ordiniUtente.add(o);
						 }
					 }
					
					 if(ordiniUtente.size()!=0) {
						 //setti la sessione e gli fai vedere la jsp degli ordini 
					 }else {
						 //caso in cui non c'è ancora un ordine effettuato. gli fai vedere la jsp vuota/alert
					 }
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
				break;
			
			case "modificaDati":
				break;
			}
			
		}
	}

}
