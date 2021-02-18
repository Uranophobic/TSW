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
		
		 
		if(azioneProfilo.equals("visualizzaDatiIndirizzo")) {
			System.out.println("sono in visualizzadatiIndirizzo");
			System.out.println(azioneProfilo);

			utente= (Utente)request.getSession().getAttribute("utenteSessione");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modificaDati.jsp");
			dispatcher.forward(request, response);

		}

		if(azioneProfilo.equals("modificaDati")) {
			try {
				
				utente= (Utente)request.getSession().getAttribute("utenteSessione");
				
				String viaModificata = request.getParameter("viaModificata");
				System.out.println("via modificata " + viaModificata);
				String cittaModificata = request.getParameter("cittaModificata");
				System.out.println("citta modificata " + cittaModificata);
				String capModificata = request.getParameter("capModificata");
				System.out.println("cap modificata " + capModificata);
				String provinciaModificata = request.getParameter("provinciaModificata");
				System.out.println("provincia modificata " + provinciaModificata);
				
				String numeroModificato = request.getParameter("numeroModificato");
				System.out.println("numero modificata " + numeroModificato);
				String scadenzaModificata = request.getParameter("scadenzaModificata");
				System.out.println("scadenza modificata " + scadenzaModificata);
				String circuitoModificato = request.getParameter("circuitoModificato");
				System.out.println("circuito modificata " + circuitoModificato);
				String cvvModificata = request.getParameter("cvvModificata");
				System.out.println("cvv modificata " + cvvModificata);
				
				String datiSped = viaModificata+"&"+cittaModificata+"&"+capModificata+"&"+provinciaModificata;
				System.out.println("dati sped: " + datiSped);
				utente.setDatiSpedizione(datiSped);
				String datiPag =  numeroModificato+"&"+scadenzaModificata+"&"+circuitoModificato+"&"+cvvModificata;  
				System.out.println("dati pag: " + datiPag);
				utente.setDatiPagamento(datiPag);
				
				String nome = utente.getNome();
				String cognome = utente.getCognome();
				String dataDiNascita = utente.getDataDiNascita();
				String password = utente.getPassword();
				System.out.println("utente:" + nome + cognome + dataDiNascita + password);
				
				
				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setDataDiNascita(dataDiNascita);
				utente.setPassword(password);
				//utente.setEmail(email);
				
				utenteModel.doUpdate(utente);
				request.getSession().setAttribute("utenteSessione", utente);
				RequestDispatcher view = request.getRequestDispatcher("profilo.jsp");
				view.forward(request,response);
				if(utenteModel.doUpdate(utente)==1) {
					System.out.println("risultato 1");
				}else {
					System.out.println("risultato 0");
				}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		if(azioneProfilo.equals("visualizzaOrdini")) {
			System.out.println("sono in visualizzaOrdini\n");
			
			Utente utente=(Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Ordine>ordiniUtente=new ArrayList<Ordine>();
			try {
				
				ArrayList<Ordine> ordiniAll=ordineModel.doRetrieveAll("emailUtente");
				
				for(int i=0;i<ordiniAll.size();i++) {
					
					if(ordiniAll.get(i).getEmailUtente().equals(utente.getEmail())) {
						System.out.println("le mail combaciano");
						
						Ordine ordine=new Ordine();
						ordine.setEmailUtente(utente.getEmail());
						ordine.setIdOrdine(ordiniAll.get(i).getIdOrdine());
						ordine.setDataOrdine(ordiniAll.get(i).getDataOrdine());
						ordine.setImportoTot(ordiniAll.get(i).getImportoTot());
						
						System.out.println("ordine del mio utente : "+ordine);
						ordiniUtente.add(ordine);
					}
					
				}
				System.out.println(" tutti gli ordini del mio utente : "+ordiniUtente);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("ordiniSessione", ordiniUtente);
			RequestDispatcher view = request.getRequestDispatcher("visualizzaOrdiniUtente.jsp");
			view.forward(request,response);
			
			}
	}
	
}
















