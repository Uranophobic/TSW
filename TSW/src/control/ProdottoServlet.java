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
import bean.Wishlist;
import modelDS.ProdottoModelDS;
import modelDS.WishlistModelDS;

/**
 * Servlet implementation class prodottoServlete
 */
@WebServlet("/prodotto")
public class ProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProdottoModelDS prodottoModel=new ProdottoModelDS();
	static WishlistModelDS wishlistModel=new WishlistModelDS();



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneP = request.getParameter("azioneP");
		System.out.println("Azione selezionata: " + azioneP);
		
		if(azioneP.equals("visualizzaCatalogo")) {
			System.out.println("sono in visualizzaCatalogo");
			try {
				ArrayList<Prodotto> catalogo=new ArrayList<Prodotto>();
				catalogo=prodottoModel.doRetrieveAll("idProdotto");
				request.getSession().setAttribute("catalogoSessione", catalogo);
				getServletContext().getRequestDispatcher("/catalogo2.jsp").forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		
		}
		
		if(azioneP.equals("visualizzaProdotto")) {
			System.out.println("sono in visualizzaProdotto\n");
			String idProdotto= request.getParameter("idProdotto");
			try {
				Prodotto prodottoBean=prodottoModel.doRetrieveByKey(idProdotto);
				request.getSession().setAttribute("prodottoVisualizzato",prodottoBean);
				RequestDispatcher view=request.getRequestDispatcher("visualizzaProdotto.jsp");
				view.forward(request, response);
				
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		if(azioneP.equals("ricerca")) {
			String effettuaRicerca=request.getParameter("barraDiRicerca");
			try {
				ArrayList<Prodotto> AllProdotti=prodottoModel.doRetrieveAll("nomeProdotto");//essere sicuri
				ArrayList<Prodotto>risultatiRicerca=new ArrayList<Prodotto>();
				/*
				 * Creiamo un arrayList che contiene il bean di prodotto, cioè che contiene 
				 * tutti i prodotti e questa cosa è possibile perchè definiamo un oggetto prodottoModel 
				 * e utilizzando il metodo doRetriveAll recuperiamo tutti i prodotti. 
				 * Dopo di che si crea un altro arrayList che dovrà contenere i prodotti che sono risultati
				 * dalla ricerca del nostro utente.
				 * Pertanto si prosegue facendo scorrere l'arraylist di prodotti per cercare il bean di prodotto
				 * cioè si fa la corrispondenza cercando dentro all'arraylist il prodotto bean o i prodotti che l'utente ha ricercato
				 */
				for(Prodotto prodottoBean: AllProdotti) {
					//recuperiamo i dati del prodotto??
					String idProdottto=request.getParameter("idProdotto");
					String immaginePathProdotto=request.getParameter("immaginePath");
					String nomeProdotto=request.getParameter("nomeProdotto");
					String descrizioneProdotto=request.getParameter("descrizioneProdotto");
					String categoriaProdotto=request.getParameter("categoriaProdotto");
					double prezzoProdotto=Double.parseDouble(request.getParameter("prezzoProdotto"));

				}

				if(risultatiRicerca.size()!=0) {
					/*
					 * Questo if va a controllare che l'array risultati ricerca non sia vuoto
					 * Quindi in risultatiricerca ci sta il risultato o meglio i prodotti che l'utente ha ricercato
					 * se è vuoto vuol dire che quel prodotto non è presente. 
					 * Ma se così non fosse procediamo
					 * 
					 */

					request.getSession().setAttribute("risultatiRicerca",risultatiRicerca);
					RequestDispatcher dispatcher=request.getRequestDispatcher("catalogo.jsp");//controlla nome jsp
					dispatcher.forward(request, response);

				}else {//se cosi non fosse..., cioè se risultatiRicerca è vuoto 

					RequestDispatcher dispatcher=request.getRequestDispatcher("404Error.jsp");//controllare nome jsp
					dispatcher.forward(request, response);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			if(azioneP.equals("aggiungiProdottoACarrello")) {
				try {
					ArrayList<Prodotto> catalogo = prodottoModel.doRetrieveAll("idProdotto");
					int quantitaCarrello =(int)(request.getSession().getAttribute("quantitaCarrello"));
					ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
					String idProd=request.getParameter("idProdotto");
					Prodotto p = prodottoModel.doRetrieveByKey(idProd);


					//carrello vuoto
					/*
					 * aggiunta di un prodotto quando il carrello è vuoto
					 */

					if(carrello.size()==0){

						Composizione composizione=new Composizione();
						composizione.setCodiceProdotto(p.getIdProdotto());
						composizione.setPrezzoUnitario(p.getPrezzo());
						composizione.setScontoAttuale(p.getSconto());
						composizione.setQuantità(1);
						carrello.add(composizione);
						quantitaCarrello++;
					}else {
						int i;
						for(i = 0; i<carrello.size(); i++){
							if((carrello.get(i).getCodiceProdotto())==idProd){
								carrello.get(i).setQuantità((carrello.get(i).getQuantità()+1));
								quantitaCarrello ++;
								//System.out.println("Sono nel FOR, prodotto incrementato");
								break;
							}else {
								//aggiungi un nuovo prodotto al carrello
								//quindi una nuova Composizione, setta tutti gli attributi
								if(i==carrello.size()){
									Composizione composizione = new Composizione();
									composizione.setCodiceProdotto(p.getIdProdotto());
									composizione.setPrezzoUnitario(p.getPrezzo());
									composizione.setScontoAttuale(p.getSconto());
									composizione.setQuantità(1);
									carrello.add(composizione);
									quantitaCarrello ++;
									//	System.out.println("Nuovo prodotto");
								}
							}
						}
					}
				}catch(SQLException ex) {
					ex.printStackTrace();
				}


			}
			if(azioneP.equals("aggiungiProdottoAWishlist")) {
				try {

					ArrayList<Prodotto> Catalogo = prodottoModel.doRetrieveAll("idProdotto");
					ArrayList<Wishlist> wishlist = (ArrayList<Wishlist>) request.getSession().getAttribute("wishlistSessione");
					ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
					String idWish=request.getParameter("idWish");
					int quantitaCarrello =(int)(request.getSession().getAttribute("quantitaCarrello"));
					Wishlist w=wishlistModel.doRetrieveByKey(idWish);
					//carrello vuoto
					if(carrello.size()==0){

						Composizione composizione=new Composizione();
						composizione.setCodiceProdotto(w.getCodiceProdotto());
						/*composizione.setPrezzoUnitario(p.getPrezzo());
						composizione.setScontoAttuale(p.getSconto());
						composizione.setQuantità(1);
						con questi non so bene
						 * 
						 */

						carrello.add(composizione);
						quantitaCarrello++;

					}
					else{
						int i;

						for(i = 0; i<carrello.size(); i++){
							//incrementa quantità di prodotto già presente
							if((carrello.get(i).getCodiceProdotto())==idWish){
								carrello.get(i).setQuantità((carrello.get(i).getQuantità()+1));
								quantitaCarrello ++;
								break;
							}else {

							}

						}
						//aggiungi un nuovo prodotto al carrello
						//quindi una nuova Composizione, setta tutti gli attributi
						if(i==carrello.size()){
							Composizione composizione = new Composizione();
							composizione.setCodiceProdotto(w.getCodiceProdotto());
							/*
							 * 	composizione.setPrezzoUnitario(p.getPrezzo());
							composizione.setScontoAttuale(p.getSconto());
							composizione.setQuantità(1);
							 * 
							 */

							carrello.add(composizione);
							quantitaCarrello ++;
						}
					}



				}catch(Exception e) {
					e.printStackTrace();
				}




			}


		}
	}
}
