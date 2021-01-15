package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Utente;
import model.UtenteModel;
import modelDS.UtenteModelDS;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	UtenteModel utenteModel = new UtenteModelDS();
	
	
    public LoginServlet() {
        super();
        System.out.println("Sono prima del doPost");
        // TODO Auto-generated constructor stub
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Sono nel doPost di login Servlet");
		String azioneLogin = request.getParameter("azioneLogin");
		System.out.println("azione" + azioneLogin);
		// controlla azione login dov'è collegata
		

			if(azioneLogin.equals("loginUtente")) {
				System.out.println("sono in loginUtente\n");
		
				try {
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					String errore= "";
					Utente utente = new Utente();
					
					utente = utenteModel.doRetrieveByKey(email);
					String mess = "Ho cercato l'utente " + utente.toString();
					System.out.println(mess);
					
					if ( utente.getEmail().equals(email)) {
						
						if(utente.getPassword().equals(password)) {
							 //utente si può loggare e quindi instaziare la sessione
							System.out.println("Mi sono loggato.\n");
							
							
							//verificare anche la sessione vecchia
							HttpSession utenteSessione = request.getSession();
							utenteSessione.setAttribute("utenteSessione", utente);
							
							RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
							dispatcher.forward(request, response);
						} else {
							System.out.println("password sbagliata, o inserisci nuovamente mail o registrati");
							errore = "Password errata.\n"; 
							RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
							dispatcher.forward(request, response);
						}
				
				} else {  //nel caso l'email non è uguale 
						System.out.println("email sbagliata, o inserisci nuovamente mail o registrati");
						errore = "Email errata.\n"; 
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
						dispatcher.forward(request, response);
				} //chiusa par. di else di utente email uguale email 

				
				if(!utente.getEmail().equals(email) && !utente.getPassword().equals(password)) {
						System.out.println("email sbagliata e password sbagliata, o inserisci nuovamente mail o registrati");
						errore = "Email e password errati, registrati.\n"; 
						RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
						dispatcher.forward(request, response);
				}//email e pasw sbagliati
					
				if( !errore.equals("") ) {
						request.setAttribute("errore", errore);		
				}
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				
				}//chiusura parentesi dell'azione login 
			
			if(azioneLogin.equals("registraUtente")) {
				System.out.println("Sono in registraUtente\n");
				
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String nome = request.getParameter("nome");
				String cognome = request.getParameter("cognome");
				String dataDiNascita = request.getParameter("dataDiNascita");
				
				System.out.println("Sto creando l'utente");
				Utente utente = new Utente();
				
				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setEmail(email);
				utente.setPassword(password);
				utente.setDataDiNascita(dataDiNascita);
				
				try {
					utenteModel.doSave(utente);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				HttpSession utenteSessione = request.getSession(); //VEDERE SE è GIUSTO 
				utenteSessione.setAttribute("utenteSessione", utente);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Homepage.jsp");
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
		
		
		
		

			
				
				
	
			}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	}

		
		

