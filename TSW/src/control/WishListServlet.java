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
import model.ComposizioneModel;
import model.ProdottoModel;
import model.WishlistModel;
import modelDS.ComposizioneModelDS;
import modelDS.ProdottoModelDS;
import modelDS.WishlistModelDS;

/**
 * Servlet implementation class WishServlet
 */
@WebServlet("/WishServlet")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	WishlistModel wish=new WishlistModelDS();
	ProdottoModel prodottoModel=new ProdottoModelDS();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/**
	 * Per questa servlet ho dovuto aggiungere bean, model e model ds perchè altrimenti non si poteva eliminare un prodotto dalla 
	 * wishlist se non avevamo il doDelete e ovviamente non si poteva aggiungere un prodotto alla wishlist senza avere il doSave
	 * (QUESTA COSA PERò OVVIAMENTE VA FATTA NELLA SERVLET DI PRODOTTO, DURANTE LA SCELTA SE AGGIUNGERE A CARRELLO O A WISHLIST)
	 * 
	 */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String azioneWishlist=request.getParameter("azioneWishList");
		/*
		 * Cosa si può fare in questa servlet??
		 * 1. immaginiamo la nostra wishlist con dei prodotti al suo interno, dopo tanti mesi non ci ricordiamo le caratteristiche 
		 * di un prodotto che abbiamo precendentemente aggiunto quando non avevamo soldi, quindi VISUALIZZARE IL PRODOTTO NEL DETTAGLIO;
		 */

		if(azioneWishlist.equals("visualizzaProdotto")) {

			try {
				wish.doRetrieveByKey("idWish");//controllare meglio questo
				RequestDispatcher viewVisualizzaProdotto=request.getRequestDispatcher("visualizzaProdotto.jsp");//si chiama cosi?
				viewVisualizzaProdotto.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}
		/*
		 * Cosa altro possiamo fare?? Immaginando sempre che stiamo guardando la nostra wishlist già bella e fatta, cioè con i prodotti 
		 * al suo interno, perchè OVVIAMENTE l'inseriemnto di un prodotto nella wishlist va fatto nella servlet di composizione o di come 
		 * vogliamo chiamarla, cioè quella servlet legata al catalogo dove guardando un prodotto possiamo decidere se metterlo nel carrello
		 * o nella wishlist.Ma dalla nostra wishlist possiamo aggiungere un prodotto che prima era nella wishlist passarlo al carrello.
		 * Quindi l'altra operazione è AGGIUNGI A CARRELLO DA WISHLIST
		 */
		if(azioneWishlist.equals("aggiungiACarello")) {

			try {
				ArrayList<Wishlist>prodottiInWish=wish.doRetrieveAll("idWish");
				/*
				 * Sono tutti i prodotti nella wishlist filtrati per l'id
				 */
				int quantitaCarrello =(int)(request.getSession().getAttribute("quantitaCarrello"));
				/*
				 * La quantità del carrello la mantenimao comunque perchè ovviamente o si aggiunge da catalogo o si
				 * aggiunge da carrello comunque va incrementato il numero dei prodotti presenti
				 */
				ArrayList<Composizione> carrello = (ArrayList<Composizione>) request.getSession().getAttribute("carrelloSessione");
				String idWish=request.getParameter("idWish");//QUesto ci serve perchè ci permette di recuperare l'id dei prodotti nella wishlist
				Wishlist w=wish.doRetrieveByKey(idWish);
				//è qui andiamo a cercare quel prodotto(sempre tramite l'id) che vogliamo mette nel carrello 
				//però dalla wishlist 
				/*
				 * Dopo di che quel id wish è legato sicuramente a un prodotto quindi recuperiamo l'id del prodotto 
				 * perchè la tabella dei prodotti in wishlist contiene l'id della wishlist e l'id del prodotto 
				 * i contenuti di un prodotto si possono recuperare tranquillamnte facendo le query quindi non si crea nessun problema.
				 * Quindi una volta recuperato l'id della wishlist, e l'id del prodotto al quale questo è associato,si procede inserendo 
				 * il prodotto nel carrello, quindi "creando" la composizione.
				 */
				String idProd=request.getParameter("codiceProdotto");
				Prodotto p=prodottoModel.doRetrieveByKey("codiceProdotto");



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
							//	System.out.println("Sono nel FOR, prodotto incrementato");
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

		if(azioneWishlist.equals("eleminaProdotto")) {
			try {
				ArrayList<Wishlist> wishlistProduct=new ArrayList<Wishlist>();//che contiene tutti i prodotti della wishlist
				for(int i=0;i<wishlistProduct.size();i++) {
					String idWish=request.getParameter("idWish");
					//String idWish=request.getParameter("idWish");//QUesto ci serve perchè ci permette di recuperare l'id dei prodotti nella wishlist
					Wishlist w=wish.doRetrieveByKey(idWish);
					wish.doDelete(idWish); //si va ad eliminare dalla wishlist quel prodotto con quell id, così facendo si elimina sicuro 
					// dal database pertanto per toglierlo anche dalla wishlist dell'utente che guarda basta che facciamo rimuovere 
					/*
					 * il prodotto con quell'id che prima abbiamo salvato in w dalla wishlist.
					 * quindi
					 */
					wishlistProduct.remove(w);
					/*
					 * Come è possibile questa cosa??? perchè l'id che noi abbiamo cercato e poi successivamente eliminato 
					 * grazie al do delete è sempre lo stesso oggetto che dopo l'eliminazione rimane all'interno dell'array 
					 * ma visto che noi sappiamo che quell'oggetto con quell'id non ci piace lo eliminiamo dalla array tanto l'oggetto con
					 * quell'id era salvato li.
					 */
				}
			}catch(Exception a ) {
				a.printStackTrace();
			}

		}
	}

}



