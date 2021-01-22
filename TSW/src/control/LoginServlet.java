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

import bean.DatiPagamento;
import bean.DatiSpedizione;
import bean.Utente;
import model.DatiPagamentoModel;
import model.DatiSpedizioneModel;
import model.UtenteModel;
import modelDS.DatiPagamentoModelDS;
import modelDS.DatiSpedizioneModelDS;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class LoginServlet
 * In questa servlet sono gestite le operazioni di login/logout dell'utente e la registrazione
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModel utenteModel = new UtenteModelDS();
	static DatiPagamentoModel datiPagModel=new DatiPagamentoModelDS();
	static DatiSpedizioneModel datiSpedModel=new DatiSpedizioneModelDS();

	Utente utente = new Utente();
	DatiPagamento datiPag=new DatiPagamento();
	DatiSpedizione datiSped=new DatiSpedizione();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneLogin = request.getParameter("azioneLogin");
		System.out.println("Azione selezionata: " + azioneLogin);

		if(azioneLogin.equals("loginUtente")) {
			/*
			 * 1 mail inserita corrisponde a quella dell'utente o meglio a una presente nel db 
			 * 	1.1 se la mail inserita non corrisponde a quella dell'utente, l'utente si deve registrare
			 * 	1.2 se la mail corrisponde controlliamo la password
			 * 2. controllo password
			 * 2.1 se la passowrd non è corretta ti dice di rimetterla 
			 * 2..2 se la password è corretta visualizza la home 
			 */

			try {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String errore= "";

				utente=utenteModel.doRetrieveByKey(email);
				System.out.println(utente);

				//if controllo mail, se la mail esiste nel db 
				if(utente.getEmail().equals(email)) {
					if(utente.getPassword().equals(password)) {
						ArrayList<DatiSpedizione> indirizziUtente = cercaIndirizzi(utente.getEmail());
						request.getSession().setAttribute("spedizioneSessione", indirizziUtente);
						request.getSession().setAttribute("utenteSessione", utente);
						
						RequestDispatcher view = request.getRequestDispatcher("/HomePage.jsp");
						view.forward(request, response);
					}else {
						System.out.println("password sbagliata\n");
						errore = "Password errata.\n"; 
						System.out.println(errore);
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("passwordFailed");
						getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

					}	
				}else {
					System.out.println("email sbagliata\n");
					errore = "Email errata.\n"; 
					/*
						System.out.println(errore);
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write("notExists");

					 */

					getServletContext().getRequestDispatcher("/404Error.jsp").forward(request, response);

				}

			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

		if(azioneLogin.equals("registraUtente")) {
			System.out.println("Sono in registraUtente\n");

			try {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String nome = request.getParameter("nome");
				String cognome = request.getParameter("cognome");
				String dataDiNascita = request.getParameter("dataDiNascita");
				String via=request.getParameter("via");
				String citta=request.getParameter("citta");
				int cap = Integer.parseInt(request.getParameter("cap"));
				String provincia=request.getParameter("provincia");
				String numeroCarta=request.getParameter("numeroCarta");
				String circuito=request.getParameter("circuito");
				String scadenzaCarta=request.getParameter("scadenzaCarta");
				int CVV = Integer.parseInt(request.getParameter("CVV"));

				System.out.println("Sto creando l'utente");

				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setEmail(email);
				utente.setPassword(password);
				utente.setDataDiNascita(dataDiNascita);
				
				System.out.println("sto creando i dati spedizione");
				
				datiSped.setVia(via);
				datiSped.setCitta(citta);
				datiSped.setCap(cap);
				datiSped.setProvincia(provincia);
				datiSped.setEmail(email);
				
				System.out.println("sto creando i dati pagamento");
				
				datiPag.setNumeroCarta(numeroCarta);
				datiPag.setCircuito(circuito);
				datiPag.setScadenzaCarta(scadenzaCarta);
				datiPag.setCVV(CVV);
				datiPag.setEmail(email);
				
				utenteModel.doSave(utente);
				datiSpedModel.doSave(datiSped);
				datiPagModel.doSave(datiPag);

				System.out.println("SPED: "+datiSped.toString());
				System.out.println("PAG: "+datiPag.toString());
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
	
			HttpSession utenteSessione = request.getSession();
			utenteSessione.setAttribute("utenteSessione", utente);

			//oltre alla sessione dell' utente ho aggiunto anche quella di dati pag e sped
		//	HttpSession datiPagSessione = request.getSession();
		//	datiPagSessione.setAttribute("datiPagSessione", datiPag);
			
			ArrayList<DatiSpedizione> indirizziUtente = cercaIndirizzi(utente.getEmail());
			HttpSession spedizioneSessione = request.getSession();
			spedizioneSessione.setAttribute("spedizioneSessione", indirizziUtente);
			
			

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomePage.jsp");
			dispatcher.forward(request, response);
		} //chiusura dell'if di registrazione 

		if(azioneLogin.equals("logoutUtente")) {
			System.out.println("Sono in logout");
			HttpSession utenteSessione;
			utenteSessione = request.getSession();
			utenteSessione.invalidate();

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
			dispatcher.forward(request, response);
		} //chiusura dell'if di loguout


		if(azioneLogin.equals("visualizzaProfilo")) {
		
			System.out.println("Visualizzo il profilo");
			try {
				utente = (Utente) request.getSession().getAttribute("utenteSessione");
				datiPag=(DatiPagamento) request.getSession().getAttribute("pagamentoSessione");
				datiSped=(DatiSpedizione)request.getSession().getAttribute("spedizioneSessione");

				ArrayList<DatiSpedizione> indirizzi = new ArrayList<DatiSpedizione>(); //tutti gli indirizzi
				ArrayList<DatiSpedizione> indirizziUtente = new ArrayList<DatiSpedizione>();
				
				indirizzi = datiSpedModel.doRetrieveAll("email");
				System.out.println("Grandezza lista di tutti gli indirizzi:"+indirizzi.size() + "\n");

				for (int i=0; i<indirizzi.size(); i++) {
					if(indirizzi.get(i).getEmail().equals(utente.getEmail())) {
						indirizziUtente.add(indirizzi.get(i));
						System.out.println("Questo è l'indirizzo dell'utente: " + indirizzi.get(i).toString());
					}
				}
				
				request.getSession().setAttribute("utenteSessione", utente);
				request.getSession().setAttribute("spedizioneSessione", indirizziUtente);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/dsprova.jsp");
			dispatcher.forward(request, response);
		}






	}

	
	
	//bisogna fare la stessa cosa con pagamento che al momento non è ancora stata gestita
	public ArrayList<DatiSpedizione> cercaIndirizzi(String email) {
		ArrayList<DatiSpedizione> indirizzi = new ArrayList<DatiSpedizione>(); //tutti gli indirizzi
		ArrayList<DatiSpedizione> indirizziUtente = new ArrayList<DatiSpedizione>();
		
		try {
			indirizzi = datiSpedModel.doRetrieveAll("email");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		for (int i=0; i<indirizzi.size(); i++) {
			if(indirizzi.get(i).getEmail().equals(utente.getEmail())) {
				indirizziUtente.add(indirizzi.get(i));
				System.out.println("Questo è l'indirizzo dell'utente: " + indirizzi.get(i).toString());
			}
		}
		
	return indirizziUtente;
	}
}




