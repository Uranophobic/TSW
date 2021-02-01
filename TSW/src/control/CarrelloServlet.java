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
import model.ComposizioneModel;
import model.ProdottoModel;
import modelDS.ComposizioneModelDS;
import modelDS.ProdottoModelDS;

/**
 * Servlet implementation class CarrelloServlet
 */
@WebServlet("/carrello")
public class CarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoModel prodModel=new ProdottoModelDS();
	static ComposizioneModel composizioneNuov= new ComposizioneModelDS();
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
		if(azioneCarrello.equals("visualizzaCarrello")) {

			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = new ArrayList<Prodotto>();

			Prodotto p = new Prodotto();
			try {
				for (int i=0; i<carrello.size(); i++) {

					p = prodModel.doRetrieveByKey(carrello.get(i).getCodiceProdotto());
					prodottiCarrello.add(p);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}

			request.getSession().setAttribute("utenteSessione", utente);
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);

			RequestDispatcher dispatcher = request.getRequestDispatcher("carrello2.jsp");
			dispatcher.forward(request, response);
		}

		if(azioneCarrello.equals("addCarrello")) {

			Utente utente =(Utente) request.getSession().getAttribute("utenteSessione");

			try {
				String idProdotto = request.getParameter("idProdotto");
				Prodotto p = prodModel.doRetrieveByKey(idProdotto);
				
				ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
				int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
				
				if(carrello.size()==0) { //carrello vuoto
					Composizione c = new Composizione();
					c.setCodiceProdotto(p.getIdProdotto());
					c.setPrezzoUnitario(p.getPrezzo());
					c.setIva(p.getIva());
					c.setScontoAttuale(p.getSconto());
					c.setQuantità(1);
					carrello.add(c);
					quantitaCar++;
					System.out.println("Quantita carrello: " + quantitaCar);
				} else { //carrello non vuoto
					int i;
					for (i=0; i<carrello.size(); i++) {
						if(carrello.get(i).getCodiceProdotto().equals(idProdotto)) {
							carrello.get(i).setQuantità(carrello.get(i).getQuantità()+1);
							quantitaCar++;
							break;
						}
					}
				
					if(i==carrello.size()) {
						Composizione c = new Composizione();
						c.setCodiceProdotto(p.getIdProdotto());
						c.setPrezzoUnitario(p.getPrezzo());
						c.setIva(p.getIva());
						c.setScontoAttuale(p.getSconto());
						c.setQuantità(1);
						carrello.add(c);
						quantitaCar++;
						System.out.println("prodotto aggiunto");
					}
					
				}
				
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().setAttribute("quantitaCarrello", quantitaCar);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.sendRedirect("catalogo2.jsp");
			//trovare un modo per non far aggiornare la pagina

		}
		
		if(azioneCarrello.equals("modificaQuantita")) {
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			//int quantita=(int) request.getSession().getAttribute("quantitaCarrello");
			int quantita=Integer.parseInt(request.getParameter("quantita"));
			for(int i=0;i<carrello.size();i++) {
				String idProdotto=request.getParameter("idProd");
				System.out.println("ID PRODOTTO: "+idProdotto);
				String getIdProdotto=prodottiCarrello.get(i).getIdProdotto();
				System.out.println("GET ID PRODOTTO: "+getIdProdotto);
				if(idProdotto.equals(getIdProdotto)) {
					if(quantita!=carrello.get(i).getQuantità()) {
			
						carrello.get(i).setQuantità(quantita);
						System.out.println("Quantita:" + quantita);
					}

				}
				
				//System.out.println("Quantita settata:" + carrello.get(i).getQuantità());
			}
			
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
		}

	
		
		if(azioneCarrello.equals("eliminaProdotto")) {
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			String  idProdotto=request.getParameter("idProd");
			System.out.println("id prod da eliminare: " + idProdotto);
			for(Composizione prod : carrello) { //prod è il prodotto da eliminare
				if(prod.getCodiceProdotto().equals(idProdotto)) {
					carrello.remove(prod);
					System.out.println("Prodotto Eliminato da carrello");
					break;
				}
			}
			
			System.out.println("carrelo DOPO ELIMINA: " + carrello);
	
			request.getSession().removeAttribute("carrelloSessione");
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().removeAttribute("prodottiCarrello");
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			
			if(carrello.size()==0) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("catalogo2.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("carrello2.jsp");
				dispatcher.forward(request, response);
			}
			
		}

		
		 

		/*

						if((carrello.get(i).getCodiceProdotto())==idProd){
							carrello.get(i).setQuantità((carrello.get(i).getQuantità()+1));
							//quantitaCarrello ++;
							//System.out.println("Sono nel FOR, prodotto incrementato");
							//break;
						//	int j=i++;
						}else {
							//aggiungi un nuovo prodotto al carrello
							//quindi una nuova Composizione, setta tutti gli attributi
							System.out.println("INDICE 2: "+i); 
							if(i==carrello.size()){
								Composizione composizione = new Composizione();
								composizione.setCodiceProdotto(p.getIdProdotto());
								composizione.setPrezzoUnitario(p.getPrezzo());
								composizione.setScontoAttuale(p.getSconto());
								int quantita=composizione.getQuantità();
								quantita++;
								composizione.setQuantità(quantita);

								carrello.add(composizione);
								request.getSession().setAttribute("carrelloSessione", carrello);
								int prodCar=carrello.size();
								System.out.println(prodCar);
							//	composizioneNuov.doSave(composizione);
								//quantitaCarrello ++;
								//	System.out.println("Nuovo prodotto");
								composizioneNuov.doSave(composizione);
							}
						}
					}
				}
					}
				}



		 */




		
	}
}
