package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Ordine;

public interface OrdineModel {

	public void doSave(Ordine ordine) throws SQLException;

	/*
	 * firma di metodo per inserimento di un oridine (INSERT INTO)
	 */

	public Ordine doRetrieveByKey(String codiceOrdine) throws SQLException;
	/*
	 * Firma di metodo che permette di ricercare un prodotto in base al codice
	 */

	public ArrayList<Ordine> doRetrieveAll(String order) throws SQLException;

	/*
	 * Firma di metodo che permette di ricevere tutte le informazioni di tutti i prodotti dato un ordine
	 */

	public int doUpdate(Ordine ordine)throws SQLException;

	/*
	 * Firma di metodo che permette di aggiornare info su un prodotto
	 */



}
