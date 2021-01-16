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

import bean.Composizione;
import bean.Prodotto;
import bean.Utente;
import model.ProdottoModel;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class CarrelloServlet
 */
@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Utente utente=new Utente();
	ArrayList<Composizione> carrello=new ArrayList<Composizione>();
	ArrayList<Prodotto> prodottiCarrello=new ArrayList<Prodotto>();
	ProdottoModel prod=new ProdottoModelDS();
       


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
	
		String azioneCarrello=request.getParameter("azioneCarrello");
		
		/*
		 * Cosa possiamo fare nella servlet del carrello? 
		 * Immaginiamoci sempre come dei deficenti che stanno sul sito e guardano il proprio carrello: quindi prima operazione
		 *1. visualizza carrello
		 	2.Eliminare un prodotto dal carrello
		 	3. Possiamo incrementare la quantità di un prodotto in un carrello
		 */
		
		switch (azioneCarrello) {
		
		case "visualizzaCarrello":
			/*
			 * mi prendo tutti i prodotti dalla sessione che l'utente ha aggiunto al carrello, li metto all'interno di un
			 * Arraylist e lo passo alla jsp che provvederà a stampare tutti i prodotti all'interno dell'arraylist 
			 * (vedi array list sopra)
			 */
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			 carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			 prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");

		
				
					request.getSession().setAttribute("utenteSessione", utente);
					request.getSession().setAttribute("carrelloSessione", carrello);
					request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
					RequestDispatcher dispatcher = request.getRequestDispatcher(" carrello.jsp ");
					dispatcher.forward(request, response);
					break;
				
			
				/*
				 * Se il carrello è vuoto possiamo mostrare il catalogo, dopo aver avvisato che il carrello è vuoto, con sopra scritto
				 * Inizia adesso ad aggiungere i tuoi prodotti preferiti, fai questo sulla jsp carrello
				 */
				
			
			/*
			 * secondo me questa si fa semplicemente con il fatto della sessione user na na na che abbiamo messo alle altre parti e 
			 * poi mostrando il proprio carrello, cioè mostra il NOSTRO CARRELLO cioè i prodotti che NOI abbiamo messo nel carrello perciò
			 * teniamo conto della sessione dell'utente che si logga. 
			 * IO LA FAREI COSì MA AMMETTO DI AVER GUARDATO DA VALENTINA E LEI LA UN PO PIù LUNGA QUINDI BOH.
			 */
			
		case "eliminaProdotto": 
			
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			 carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			 prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			 for(int i=0;i<=carrello.size();i++) {
				String  idProdotto=request.getParameter("idProdotto");
				if(idProdotto.equals(prodottiCarrello.get(i).getIdProdotto())) {
					prodottiCarrello.remove(idProdotto);
					carrello.remove(idProdotto);
					
				}
				/*
				try {
					Prodotto p= prod.doRetrieveByKey(idProdotto);
					prod.doDelete(idProdotto);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				*/
				
				
			 }
			/*
			 * Questa si fa così, sempre secondo me come gli altri elimina, ci prendiamo scorriamo i prodotti nel carello, li scorriamo 
			 * e ci prendiamo con doRetreiveAll quello con il nostro id. Abbiamo un array di prodotti che stanno nel carello e poi usiamo 
			 * il doDelete del prodotto e andiamo successivamente a decrementare il prodotto dall'array di prodotti nel carello.
			 */
			break;
		
		case "incrementaQuantita": 
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			 carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			 prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			 for(int i=0;i<=carrello.size();i++) {
				 String idProdotto=request.getParameter("idProdotto");
				 int quantita=Integer.parseInt(request.getParameter("quantità"));
				 if(idProdotto.equals(prodottiCarrello.get(i).getIdProdotto())) {
					if(quantita==(carrello.get(i).getQuantità())) {
						quantita=quantita+1;
						carrello.get(i).setQuantità(quantita);
					}
					 
				 }
				 
			 }
			break;
			
		case "decrementaQuantita": 
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			 carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			 prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			 for(int i=0;i<=carrello.size();i++) {
				 String idProdotto=request.getParameter("idProdotto");
				 int quantita=Integer.parseInt(request.getParameter("quantità"));
				 if(idProdotto.equals(prodottiCarrello.get(i).getIdProdotto())) {
					if(quantita==(carrello.get(i).getQuantità())) {
						quantita=quantita-1;
						carrello.get(i).setQuantità(quantita);
					}
					 
				 }
				 
			 }
			break;
			
		}
	}

}
