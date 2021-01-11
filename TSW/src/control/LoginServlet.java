package control;

import java.io.IOException;
import java.sql.SQLException;

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
    
	Utente utente = new Utente();
	UtenteModel utenteModel = new UtenteModelDS();
	HttpSession VecchiaSessione;
	HttpSession NuovaSessione;
	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * 
	 * azioneLogin =
	 * 1) Accesso dell'utente 
	 * 2) Accesso dell'amministratore
	 * 3) Registrazione dell'utente
	 * 4) Logout dell'utente
	 * 5) Logout dell'amministratore
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneLogin = request.getParameter("azioneLogin");
		// controlla azione login dov'è collegata
		
		if (azioneLogin != null) {
			switch (azioneLogin) {
			
				case "loginUtente": 
					String email = request.getParameter("email");
					String password = request.getParameter("password");
					
				try {
					utente = utenteModel.doRetrieveByKey(email);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(!utente.getEmail().equals(null)) { //controlla se è diversa da null
					if(utente.getPassword().equals(password)) {
						
						System.out.println("Email e password funzionano");
						VecchiaSessione=request.getSession();
						if(VecchiaSessione!=null) {
							/*
							 * perchè se è diverso da null vuol dire che la sessione esiste già e la invalidiamo
							 */
							VecchiaSessione.invalidate();
						}else{
							
							NuovaSessione.setAttribute("utenteSessione", utente);
							//controllare maiuscole e minuscole della parola sessioneUtente e in caso uniformarla
						}
					
						
					} else {
						
						System.out.println("password non corretta");
						request.getSession().getAttribute("errore password");//nel caso non va controllare qua
					}
				} else {
					
					/*
					 * vuol dire che anche l'email è sbagliata e di all'utente di reinserirla oppure registrarsi 
					 */
					System.out.println("email sbagliata, o inserisci nuovamente mail o registrati");
					request.getSession().getAttribute("errore email/registrazione");//nel caso controllare qua
				}
				
				break; 
				
				case "registraUtente" : 
					
					 email = request.getParameter("email");
					 password = request.getParameter("password");
					 String nome = request.getParameter("nome");
					 String cognome = request.getParameter("cognome");
					 String dataDiNascita = request.getParameter("dataNascita");
					 
					 utente.setEmail(email);
					 utente.setPassword(password);
					 utente.setNome(nome);
					 utente.setCognome(cognome);
					 utente.setDataDiNascita(dataDiNascita);
					 
				try {
					utenteModel.doSave(utente);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				NuovaSessione.setAttribute("utenteSessione", utente);
				
				getServletContext().getRequestDispatcher("homepage.jsp").forward(request, response);
				
				break; 
				
				case "logoutUtente" : 
					
					NuovaSessione = request.getSession();
					NuovaSessione.invalidate();
					/*
					 * VecchiaSessione=request.getSessione();
					 * VecchiaSessione.invalidate();
					 */
					
					getServletContext().getRequestDispatcher("homepage.jsp").forward(request, response);
					//RequestDispatcher dispatcher  = request.getRequestDispather("homepage.jsp"); 
					//dispatcher.forward(request , response);
					break;
			}
		}
		
	}

}
