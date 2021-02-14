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
		System.out.println("sono in carrello: "+azioneCarrello);

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

			RequestDispatcher dispatcher = request.getRequestDispatcher("carrello.jsp");
			dispatcher.forward(request, response);
		}

		if(azioneCarrello.equals("addCarrello")) {

			Utente utente =(Utente) request.getSession().getAttribute("utenteSessione");

			try {
				String idProdotto = request.getParameter("idProdotto");
				/*
				 * idProdotto non va modificato in quanto fa riferimento al catalogo dove si chiama idProdotto
				 * per aggiungere il prodotto al carrello
				 */
				System.out.println("id prodotto da aggiungere: "+idProdotto);
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
						System.out.println("quantitaCar: "+quantitaCar);
					}

				}

				request.getSession().setAttribute("carrelloSessione", carrello);
				request.getSession().setAttribute("quantitaCarrello", quantitaCar);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.sendRedirect("catalogo.jsp");
			//trovare un modo per non far aggiornare la pagina

		}

		if(azioneCarrello.equals("modificaQuantita")) {
			 
			
			
			try {
				String idProd = request.getParameter("idProd");
				Prodotto p = prodModel.doRetrieveByKey(idProd);
				
				int quantita = Integer.parseInt(request.getParameter("quantita"));
				ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
				int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
				
			
					int i;
					for(i = 0; i<carrello.size(); i++){
						System.out.println("\n SONO NEL FOR \n ");
						System.out.println("carrello get i get codice prod" + carrello.get(i).getCodiceProdotto() + " | idProd: " + idProd);

						//incrementa quantità di prodotto già presente
						if((carrello.get(i).getCodiceProdotto()).equals(idProd)){
							System.out.println("\n SONO NELL' IFFFFFFFFFFFFFFF \n: ");
							System.out.println("carrello get i get codice prod" + carrello.get(i).getCodiceProdotto() + " | idProd: " + idProd);
							carrello.get(i).setCodiceProdotto(p.getIdProdotto());
							System.out.println("codice prod: "+ carrello.get(i).getCodiceProdotto());
							carrello.get(i).setIva(p.getIva());
							System.out.println("iva: "+ carrello.get(i).getIva());
							carrello.get(i).setPrezzoUnitario(p.getPrezzo());
							System.out.println("prezzo: "+ carrello.get(i).getPrezzoUnitario());
							carrello.get(i).setScontoAttuale(p.getSconto());
							System.out.println("sconto: "+ carrello.get(i).getScontoAttuale());
							carrello.get(i).setQuantità(quantita);
							quantitaCar = quantita;
							System.out.println("QUANTITA DEL PRODOTTO CHE HO AGGIUNTO: "+ quantita);
							System.out.println("nome: "+ p.getNome());
							break;
						}
					}

				
				

				
				
				
				request.getSession().removeAttribute("carrelloSessione");
				request.getSession().setAttribute("carrelloSessione", carrello);
				request.getSession().removeAttribute("quantitaCarrello");
				request.getSession().setAttribute("quantitaCarrello", quantitaCar);
				System.out.println(quantita + "questa è la quantità di chi ti è biecchio");
				RequestDispatcher view = request.getRequestDispatcher("catalogo.jsp");
				view.forward(request, response);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			/*
			 * ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
			//int quantita=(int) request.getSession().getAttribute("quantitaCarrello");
			int quantita=Integer.parseInt(request.getParameter("quantita"));

			for(int i=0;i<carrello.size();i++) {
				String idProdotto=request.getParameter("idProd");
				System.out.println("ID PRODOTTO: "+idProdotto);
				String getIdProdotto=prodottiCarrello.get(i).getIdProdotto();
				System.out.println("GET ID PRODOTTO: "+getIdProdotto);
				if(idProdotto.equals(getIdProdotto)) {
					if((quantita!=carrello.get(i).getQuantità())&&(quantita!=0)) {
						quantitaCar=quantita;
						carrello.get(i).setQuantità(quantita);
						System.out.println("Quantita:" + quantita);
						System.out.println("Quantita carrello: " + quantitaCar);
						request.getSession().setAttribute("quantitaCarrello", quantitaCar);
					}


					
				}

			}


			request.getSession().removeAttribute("prodottiCarrello");
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			request.getSession().removeAttribute("carrelloSessione");
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().removeAttribute("quantitaCarrello");
			request.getSession().setAttribute("quantitaCarrello", quantitaCar);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage.jsp");
			dispatcher.forward(request, response);
			 * 
			 */
			
		}



		if(azioneCarrello.equals("eliminaProdotto")) {
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
			String  idProdottoDelete=request.getParameter("idProdDelete");
			System.out.println("id prod da eliminare (idProdDelete): " + idProdottoDelete);//prod è il prodotto da eliminare

			for(Composizione prod : carrello) {

				String getIdProd=prod.getCodiceProdotto();
				if(idProdottoDelete.equals(getIdProd)) {
					carrello.remove(prod);
					quantitaCar--;
					System.out.println("Prodotto Eliminato da carrello");
					System.out.println("Quantita dopo elimina di un prodotto: "+quantitaCar);
					break;
				}
			}

			System.out.println("carrelo DOPO ELIMINA: " + carrello);

			request.getSession().removeAttribute("carrelloSessione");
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().removeAttribute("prodottiCarrello");
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			request.getSession().removeAttribute("quantitaCarrello");
			request.getSession().setAttribute("quantitaCarrello", quantitaCar);

			if(carrello.size()==0) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("catalogo.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("carrello.jsp");
				dispatcher.forward(request, response);
			}

		}
		


	}
}