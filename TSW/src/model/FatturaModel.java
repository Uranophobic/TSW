package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Fattura;

public interface FatturaModel {

	public void doSave(Fattura fattura) throws SQLException;



	public Fattura doRetrieveByKey(String codiceFattura) throws SQLException;


	public ArrayList<Fattura> doRetrieveAll(String order) throws SQLException;



}
