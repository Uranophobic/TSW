package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Utente;

public interface UtenteModel {


	public void doSave(Utente utente) throws SQLException;

	

	public Utente doRetrieveByKey(String email) throws SQLException;
	

	public ArrayList<Utente> doRetrieveAll(String order) throws SQLException;

	
	public int doUpdate(Utente utente)throws SQLException;

	
}
