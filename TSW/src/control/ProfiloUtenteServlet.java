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
import bean.DatiSpedizione;
import bean.DatiPagamento;
import bean.Ordine;
import model.DatiPagamentoModel;
import model.DatiSpedizioneModel;
import model.OrdineModel;
import model.UtenteModel;
import modelDS.DatiPagamentoModelDS;
import modelDS.DatiSpedizioneModelDS;
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
	static DatiPagamentoModel datiPagModel=new DatiPagamentoModelDS();
	static DatiSpedizioneModel datiSpedModel=new DatiSpedizioneModelDS();
	Utente utente = new Utente();
	DatiSpedizione datiSped=new DatiSpedizione();
	DatiPagamento datiPag=new DatiPagamento();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//getServletContext().getRequestDispatcher("/view/profiloUtente.jsp").forward(request, response);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("sono del dopost di profilo utente");
		String azioneProfilo = request.getParameter("azioneProfilo");

		if(azioneProfilo.equals("visualizzaProfilo")) {
			/*
			 * forse mettere in homepage
			 * togliere telefono dalla jsp
			 * controllare nella jsp se i nomi coincidono
			 */
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			datiPag=(DatiPagamento) request.getSession().getAttribute("datiPagSessione");
			datiSped=(DatiSpedizione)request.getSession().getAttribute("datiSpedSessione");
			
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String dataDiNascita = request.getParameter("dataDiNascita");
			/*
			 * mettere numeroCarta (scritto così) anche nella jsp, 
			 * aggiungi altri attributi relativi alla carta sulla jsp
			 */
			String numeroCarta=request.getParameter("numeroCarta");
			String scadenzaCarta=request.getParameter("scadenzaCarta");
			int CVV=Integer.parseInt(request.getParameter("CVV"));
			String circuito=request.getParameter("circuito");
			
			
			String via=request.getParameter("via");
			String citta=request.getParameter("citta");
			String provincia=request.getParameter("provincia");
			int cap=Integer.parseInt(request.getParameter("cap"));
			
			
			utente.setEmail(email);
			utente.setPassword(password);
			utente.setNome(nome);
			utente.setCognome(cognome);
			utente.setDataDiNascita(dataDiNascita);
			
			
			datiPag.setNumeroCarta(numeroCarta);
			datiPag.setScadenzaCarta(scadenzaCarta);
			datiPag.setCVV(CVV);
			datiPag.setCircuito(circuito);
			datiPag.setEmail(email);
			
			
			datiSped.setEmail(email);
			datiSped.setVia(via);
			datiSped.setCitta(citta);
			datiSped.setProvincia(provincia);
			datiSped.setCap(cap);
			
			request.getSession().setAttribute("utenteSessione", utente);
			request.getSession().setAttribute("datiPagSessione", datiPag);
			request.getSession().setAttribute("datiSpedSessione", datiSped);
			
			response.sendRedirect("profiloUtente.jsp");
		}

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
		if(azioneProfilo.equals("visualizzaDati")) {

			try {
				//ricontrolla i nomi e nel caso unificare i controlli nell'if
				ArrayList<DatiSpedizione> allIndirizzi= new ArrayList<DatiSpedizione>();

				allIndirizzi=datiSpedModel.doRetrieveAll("email");
				if(allIndirizzi.size()!=0) {
					RequestDispatcher view=request.getRequestDispatcher("modificaDatiUtente.jsp");//si chiama cosi?
					view.forward(request, response);

				}else {
					request.getSession().setAttribute("vuotoDatiSped", allIndirizzi);
				}


				ArrayList<DatiPagamento> allCarte=new ArrayList<DatiPagamento>();
				allCarte= datiPagModel.doRetrieveAll("email");
				if(allCarte.size()!=0) {
					RequestDispatcher view=request.getRequestDispatcher("modificaDatiUtente.jsp");//si chiama cosi?
					view.forward(request, response);
				}else {
					request.getSession().setAttribute("vuotoDatiPag", allCarte);
				}



			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if(azioneProfilo.equals("modificaDati")) {
				if(azioneProfilo.equals("modificaIndirizzo")) {

					ArrayList<DatiSpedizione> indirizzi= new ArrayList<DatiSpedizione>();
					try {
						indirizzi=datiSpedModel.doRetrieveAll("email");
						for(int i=0;i<indirizzi.size();i++) {
							//gestire nella jsp o meglio come comunico che voglio modificare quell indirizzo??
							String via=request.getParameter("via");
							String citta=request.getParameter("citta");
							int cap=Integer.parseInt(request.getParameter("cap"));
							String provincia=request.getParameter("provincia");

							datiSped.setVia(via);
							datiSped.setCitta(citta);
							datiSped.setCap(cap);
							datiSped.setProvincia(provincia);

							datiSpedModel.doUpdate(datiSped);


							//	if(indirizzi.get(i).getEmail().equals(utente.getEmail())){



						}
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}//controlla nome 

					//via,citta, cap, provincia
				}

				if(azioneProfilo.equals("modificaPagamento")) {

				}
			}
		}
	}
}