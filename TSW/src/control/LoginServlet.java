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
 * In questa servlet sono gestite le operazioni di login/logout dell'utente e la registrazione
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	UtenteModel utenteModel = new UtenteModelDS();
	Utente utente = new Utente();
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Sono nel doPost di login Servlet");
		String azioneLogin = request.getParameter("azioneLogin");
		System.out.println("azione" + azioneLogin);
		
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
							//password corretta
							//perchè la mail è corretta e la password pure quindi mostra la homepage
							getServletContext().getRequestDispatcher("/HomePage.jsp").forward(request, response);
							
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
				
				System.out.println("Sto creando l'utente");
	
				
				utente.setNome(nome);
				utente.setCognome(cognome);
				utente.setEmail(email);
				utente.setPassword(password);
				utente.setDataDiNascita(dataDiNascita);
				
				utenteModel.doSave(utente);
				System.out.println("ECCO: " + utente.toString());
				
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				HttpSession utenteSessione = request.getSession(); //VEDERE SE è GIUSTO 
				utenteSessione.setAttribute("utenteSessione", utente);
				
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
		
		
		
		

			
				
				
	
			}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	}

		
		

