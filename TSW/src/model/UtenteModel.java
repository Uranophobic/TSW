package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Utente;

public interface UtenteModel {


	public void doSave(Utente utente) throws SQLException;

	/*
	 * firma di metodo per inserimento utente (INSERT INTO)
	 */

	public Utente doRetrieveByKey(String email) throws SQLException;
	/*
	 * Firma di metodo che permette di ricercare un utente in base alla mail
	 */

	public ArrayList<Utente> doRetrieveAll(String order) throws SQLException;

	/*
	 * Firma di metodo che permette di ricevere tutte le informazioni di tutti gli utente dato un ordine
	 */

	public int doUpdate(Utente utente)throws SQLException;

	/*
	 * Firma di metodo che permette di aggiornare info su un utente
	 */
}
