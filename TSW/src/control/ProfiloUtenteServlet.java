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
import javax.servlet.http.HttpSession;
import bean.Utente;
import bean.Ordine;
import model.OrdineModel;
import model.UtenteModel;
import modelDS.OrdineModelDS;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class ProfiloUtenteServlet
 */
@WebServlet("/profilo")
public class ProfiloUtenteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static OrdineModel ordineModel = new OrdineModelDS();
	static UtenteModel utenteModel = new UtenteModelDS();
	Utente utente = new Utente();


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);


	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono del dopost di profilo utente");
		String azioneProfilo = request.getParameter("azioneProfilo");
		/*
		if(azioneProfilo.equals("visualizzaWishList")) {

			RequestDispatcher dispatcher = request.getRequestDispatcher("wishlist.jsp");

		}

		if(azioneProfilo.equals("visualizzaOrdini")) {
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
		}
		 */
		if(azioneProfilo.equals("visualizzaDatiIndirizzo")) {
			System.out.println("sono in visualizzadatiIndirizzo");
			System.out.println(azioneProfilo);

			utente= (Utente)request.getSession().getAttribute("utenteSessione");


			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modificaDati.jsp");
			dispatcher.forward(request, response);

		}

		//ho messo bottonemodifica che sarebbe il bottone verde a posto di modificaDatiIndirizzo
		if(azioneProfilo.equals("bottoneModifica")) {

		}
	}
}
















