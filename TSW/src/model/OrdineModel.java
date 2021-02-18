package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Ordine;

public interface OrdineModel {

	public void doSave(Ordine ordine) throws SQLException;

	public Ordine doRetrieveByKey(String codiceOrdine) throws SQLException;
	

	public ArrayList<Ordine> doRetrieveAll(String order) throws SQLException;

	
	public int doUpdate(Ordine ordine)throws SQLException;

	



}
