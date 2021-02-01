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
		 	3. Possiamo incrementare la quantit� di un prodotto in un carrello
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
					c.setQuantit�(1);
					carrello.add(c);
					quantitaCar++;
					System.out.println("Quantita carrello: " + quantitaCar);
				} else { //carrello non vuoto
					int i;
					for (i=0; i<carrello.size(); i++) {
						if(carrello.get(i).getCodiceProdotto().equals(idProdotto)) {
							carrello.get(i).setQuantit�(carrello.get(i).getQuantit�()+1);
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
						c.setQuantit�(1);
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
		
		if(azioneCarrello.equals("incrementaQuantita")) {
			System.out.println("Incremento!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			int quantita=(int) request.getSession().getAttribute("quantitaCarrello");
			System.out.println("QUANTITA': "+quantita);
			for(int i=0;i<carrello.size();i++) {
				String idProdotto=request.getParameter("idProd");
				System.out.println("ID PRODOTTO: "+idProdotto);
				String getIdProdotto=prodottiCarrello.get(i).getIdProdotto();
				System.out.println("GET ID PRODOTTO: "+getIdProdotto);
				if(idProdotto.equals(getIdProdotto)) {
					if(quantita==(carrello.get(i).getQuantit�())) {
						quantita=quantita+1;
						carrello.get(i).setQuantit�(quantita);
						System.out.println("Incremento:" + quantita);
					}

				}
			}
			
	
		}

		if(azioneCarrello.equals("decrementaQuantita")) {
			System.out.println("decremento!!!!!!!!!!!!!!!!!!!!!!!!!!!1");
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			for(int i=0;i<=carrello.size();i++) {
				String idProdotto=request.getParameter("idProdotto");
				int quantita=Integer.parseInt(request.getParameter("quantitaCarrello"));
				if(idProdotto.equals(prodottiCarrello.get(i).getIdProdotto())) {
					if(quantita==(carrello.get(i).getQuantit�())) {
						quantita=quantita-1;
						carrello.get(i).setQuantit�(quantita);
						System.out.println("Decremento:" + quantita);
					}

				}

			}

		}

		/*
		if(azioneCarrello.equals("eliminaProdotto")) {
			utente = (Utente) request.getSession().getAttribute("utenteSessione");
			carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			for(int i=0;i<=carrello.size();i++) {
				String  idProdotto=request.getParameter("idProdotto");
				if(idProdotto.equals(prodottiCarrello.get(i).getIdProdotto())) {
					prodottiCarrello.remove(idProdotto);
					carrello.remove(idProdotto);

				}
			}

		}

		
		 */

		/*

						if((carrello.get(i).getCodiceProdotto())==idProd){
							carrello.get(i).setQuantit�((carrello.get(i).getQuantit�()+1));
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
								int quantita=composizione.getQuantit�();
								quantita++;
								composizione.setQuantit�(quantita);

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




		/*
		 * VISUALIZZA CARRELLO
		 * mi prendo tutti i prodotti dalla sessione che l'utente ha aggiunto al carrello, li metto all'interno di un
		 * Arraylist e lo passo alla jsp che provveder� a stampare tutti i prodotti all'interno dell'arraylist 
		 * (vedi array list sopra)
		 *
		 * Se il carrello � vuoto possiamo mostrare il catalogo, dopo aver avvisato che il carrello � vuoto, con sopra scritto
		 * Inizia adesso ad aggiungere i tuoi prodotti preferiti, fai questo sulla jsp carrello
		 * secondo me questa si fa semplicemente con il fatto della sessione user na na na che abbiamo messo alle altre parti e 
		 * poi mostrando il proprio carrello, cio� mostra il NOSTRO CARRELLO cio� i prodotti che NOI abbiamo messo nel carrello perci�
		 * teniamo conto della sessione dell'utente che si logga. 
		 * IO LA FAREI COS� MA AMMETTO DI AVER GUARDATO DA VALENTINA E LEI LA UN PO PI� LUNGA QUINDI BOH.
		 */


		/*
		 * ELIMINA PRODOTTO DA CARRELLO
		 * Questa si fa cos�, sempre secondo me come gli altri elimina, ci prendiamo scorriamo i prodotti nel carello, li scorriamo 
		 * e ci prendiamo con doRetreiveAll quello con il nostro id. Abbiamo un array di prodotti che stanno nel carello e poi usiamo 
		 * il doDelete del prodotto e andiamo successivamente a decrementare il prodotto dall'array di prodotti nel carello.
		 */

	}
}
