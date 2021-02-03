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

			RequestDispatcher dispatcher = request.getRequestDispatcher("carrello2.jsp");
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

			response.sendRedirect("catalogo2.jsp");
			//trovare un modo per non far aggiornare la pagina

		}

		if(azioneCarrello.equals("modificaQuantita")) {
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
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
					}


					if(quantita==0) {
						quantitaCar=0;
						Prodotto prodottoDelete=new Prodotto();

						prodottoDelete.setIdProdotto(prodottiCarrello.get(i).getIdProdotto());
						prodottoDelete.setNome(prodottiCarrello.get(i).getNome());
						prodottoDelete.setDescrizione(prodottiCarrello.get(i).getDescrizione());
						prodottoDelete.setCategoria(prodottiCarrello.get(i).getCategoria());
						prodottoDelete.setImmaginePath(prodottiCarrello.get(i).getImmaginePath());
						prodottoDelete.setPrezzo(prodottiCarrello.get(i).getPrezzo());
						prodottoDelete.setSconto(prodottiCarrello.get(i).getSconto());
						prodottoDelete.setIva(prodottiCarrello.get(i).getIva());

						System.out.println("prodotto "+prodottoDelete);

						Composizione compDelete= new Composizione();
						compDelete.setCodiceProdotto(carrello.get(i).getCodiceProdotto());
						compDelete.setPrezzoUnitario(carrello.get(i).getPrezzoUnitario());
						compDelete.setScontoAttuale(carrello.get(i).getScontoAttuale());
						compDelete.setIva(carrello.get(i).getIva());
						compDelete.setQuantità(carrello.get(i).getQuantità());



						prodottiCarrello.remove(prodottoDelete);
						carrello.remove(compDelete);
						System.out.println("Prodotto eliminato da prodottiCarrello: "+prodottoDelete.toString());
						System.out.println(" prodotti nel carrello "+prodottiCarrello.toString());
						System.out.println("composizione da eliminare: "+compDelete.toString());

						request.getSession().removeAttribute("prodottiCarrello");
						request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
						request.getSession().removeAttribute("carrello");
						request.getSession().setAttribute("carrelloSessione", carrello);
						request.getSession().removeAttribute("quantitaCarrello");
						request.getSession().setAttribute("quantitaCarrello", quantitaCar);


						RequestDispatcher dispatcher = request.getRequestDispatcher("catalogo2.jsp");
						dispatcher.forward(request, response);


					}
				}

			}


			request.getSession().removeAttribute("prodottiCarrello");
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			request.getSession().removeAttribute("carrello");
			request.getSession().setAttribute("carrelloSessione", carrello);
			request.getSession().removeAttribute("quantitaCarrello");
			request.getSession().setAttribute("quantitaCarrello", quantitaCar);
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
				RequestDispatcher dispatcher = request.getRequestDispatcher("catalogo2.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("carrello2.jsp");
				dispatcher.forward(request, response);
			}

		}
		
		if(azioneCarrello.equals("totale")) {
			
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = new ArrayList<Prodotto>();
			int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
			double totale=0;
			String idProdTotale=request.getParameter("idProdTotale");//il prodotto singole del quale vogliamo fare il totale=prezzo*quanita
			System.out.println("id prodotto totale: "+idProdTotale);
			
			for(int i=0;i<carrello.size();i++) {
				
			}

			
		}

	}
}
