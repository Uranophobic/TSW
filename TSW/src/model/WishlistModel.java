package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Utente;
import bean.Wishlist;

public interface WishlistModel {
	
	public void doSave(Wishlist wishlist) throws SQLException;

	/*
	 * firma di metodo per inserimento di un prodotto dal catalogo alla wishlist(INSERT INTO)
	 */

	public Wishlist doRetrieveByKey(String idWish) throws SQLException;
	/*
	 * Firma di metodo che permette di ricercare un prodotto nella wishlist in base all'id
	 */

	public ArrayList<Wishlist> doRetrieveAll(String order) throws SQLException;
	
	/*
	 * OVVIAMENTE CI STA SCRITTO ARRAYLIST DI WISHLIST MA NON E CHE TORNA LE WISHLIST TORNA TUTTI I PRODOTTI PRESENTI NELLE WISHLIST
	 */
	/*
	 * Firma di metodo che permette di ricevere tutte le informazioni di tutti i prodotti in una wishlist secondo un dato ordine
	 */

	public int doUpdate(Wishlist wishlist)throws SQLException;

	/*
	 * Firma di metodo che permette di aggiornare i prodotti all'interno della wishlist
	 */
	public void doDelete(String idWish, String email) throws SQLException;
	/*
	 * metodo che permette di eliminare un prodotto dalla wishlist
	 */

}
