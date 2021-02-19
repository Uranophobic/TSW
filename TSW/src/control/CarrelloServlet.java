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
				} else { 
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
						
							break;
						}
					}

				request.getSession().removeAttribute("carrelloSessione");
				request.getSession().setAttribute("carrelloSessione", carrello);
				request.getSession().removeAttribute("quantitaCarrello");
				request.getSession().setAttribute("quantitaCarrello", quantitaCar);
				RequestDispatcher view = request.getRequestDispatcher("carrello.jsp");
				view.forward(request, response);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}



		if(azioneCarrello.equals("eliminaProdotto")) {
			Utente utente = (Utente) request.getSession().getAttribute("utenteSessione");
			ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
			ArrayList<Prodotto> prodottiCarrello = (ArrayList<Prodotto>) request.getSession().getAttribute("prodottiCarrello");
			int quantitaCar = (int) request.getSession().getAttribute("quantitaCarrello");
			String  idProdottoDelete=request.getParameter("idProdDelete");
			System.out.println("id prod da eliminare (idProdDelete): " + idProdottoDelete);//prod è il prodotto da eliminare

			
			for(int i=0; i<carrello.size(); i++) {
				if(carrello.get(i).getCodiceProdotto().equals(idProdottoDelete)) {
					carrello.remove(i);
					prodottiCarrello.remove(i);
					quantitaCar--;
					System.out.println("Quantita dopo elimina di un prodotto: "+quantitaCar);
				}
			
			}
			
			
			System.out.println("\n\n carrelo DOPO ELIMINA: " + carrello);
			System.out.println("\n \nPRODOTTI carrelo DOPO ELIMINA: " + prodottiCarrello);

			
			request.getSession().setAttribute("carrelloSessione", carrello);
			
			request.getSession().setAttribute("prodottiCarrello", prodottiCarrello);
			
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