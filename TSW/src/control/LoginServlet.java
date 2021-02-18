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

import bean.Composizione;
import bean.Ordine;
import bean.Prodotto;
import bean.Utente;
import model.UtenteModel;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class LoginServlet
 * In questa servlet sono gestite le operazioni di login/logout dell'utente e la registrazione
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static UtenteModel utenteModel = new UtenteModelDS();

	Utente utente = new Utente();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneLogin = request.getParameter("azioneLogin");
		System.out.println("Azione selezionata: " + azioneLogin);

		//var per i prod nel carrello
		int quantitaCar=0; 
		request.getSession().setAttribute("quantitaCarrello", quantitaCar);
		
		if(azioneLogin.equals("loginUtente")) {

			try {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				

				utente=utenteModel.doRetrieveByKey(email);
				System.out.println(utente);

				if(utente.getEmail().equals("admin@gmail.com")) {
					System.out.println("admin entrato");
					request.getSession().setAttribute("capoSessione", utente);
				}
				
				
				//if controllo mail, se la mail esiste nel db 
				if(utente.getEmail().equals(email)) {
					if(utente.getPassword().equals(password)) {
						
						response.setContentType("text/html;charset=ISO-8859-1");
						response.getWriter().write("successo");
						
						request.getSession().setAttribute("utenteSessione", utente);
						
						//sessione del carrello
						ArrayList<Composizione>carrello=new ArrayList<Composizione>();
						request.getSession().setAttribute("carrelloSessione",carrello);
						
						//sessione dei prodotti nel carrello
						ArrayList<Prodotto> prodottiCarrello=new ArrayList<Prodotto>();
						request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
						
						//sessione degli ordini
						ArrayList<Ordine> ordini=new ArrayList<Ordine>();
						request.getSession().setAttribute("ordiniSessione", ordini);

						//sessione ricerca
						ArrayList<Prodotto> risultatiRicerca = new ArrayList<Prodotto>();
						request.getSession().setAttribute("risultatiRicerca", risultatiRicerca);
						
						
						
						
						RequestDispatcher view = request.getRequestDispatcher("/HomePage.jsp");
						view.forward(request, response);
					}else {
						System.out.println("password sbagliata\n");
						response.setContentType("text/html;charset=ISO-8859-1");
						response.getWriter().write("passwordFailed");
						

					}	
				}else {
					System.out.println("email sbagliata\n");
					response.setContentType("text/html;charset=ISO-8859-1");
					response.getWriter().write("notExists");

					

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
				String cap = request.getParameter("cap");
				String provincia=request.getParameter("provincia");
				String numeroCarta=request.getParameter("numeroCarta");
				String circuito=request.getParameter("circuito");
				String scadenzaCarta=request.getParameter("scadenzaCarta");
				String CVV = request.getParameter("CVV");

				System.out.println("Sto creando l'utente");

				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setEmail(email);
				utente.setPassword(password);
				utente.setDataDiNascita(dataDiNascita);

				String datiSpedizione=via+"&"+citta+"&"+cap+"&"+provincia;				
				String datiPagamento=numeroCarta+"&"+scadenzaCarta+"&"+circuito+"&"+CVV;

				utente.setDatiPagamento(datiPagamento);
				utente.setDatiSpedizione(datiSpedizione);


				utenteModel.doSave(utente);


				System.out.println("SPED: "+datiSpedizione);
				System.out.println("PAG: "+datiPagamento);

			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			//sessione dell'utente
			HttpSession utenteSessione = request.getSession();
			utenteSessione.setAttribute("utenteSessione", utente);

			//sessione del carrello
			ArrayList<Composizione>carrello=new ArrayList<Composizione>();
			request.getSession().setAttribute("carrelloSessione",carrello);
			
			//sessione dei prodotti nel carrello
			ArrayList<Prodotto> prodottiCarrello=new ArrayList<Prodotto>();
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			
			//sessione degli ordini
			ArrayList<Ordine> ordini=new ArrayList<Ordine>();
			request.getSession().setAttribute("ordiniSessione", ordini);
					
			//sessione ricerca
			ArrayList<Prodotto> risultatiRicerca = new ArrayList<Prodotto>();
			request.getSession().setAttribute("risultatiRicerca", risultatiRicerca);

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		} //chiusura dell'if di registrazione 

		if(azioneLogin.equals("logoutUtente")) {
			System.out.println("Sono in logout");
			HttpSession utenteSessione;
			utenteSessione = request.getSession();
			utenteSessione.invalidate();

			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HomePage.jsp");
			dispatcher.forward(request, response);
		} //chiusura dell'if di loguout


		if(azioneLogin.equals("visualizzaProfilo")) {

			System.out.println("Visualizzo il profilo");

			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			request.getSession().setAttribute("utenteSessione", utente);



			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profilo.jsp");
			dispatcher.forward(request, response);
		}
		
	}


}









