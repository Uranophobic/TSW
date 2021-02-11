package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Prodotto;

public interface ProdottoModel {

	public void doSave(Prodotto prodotto) throws SQLException;



	public Prodotto doRetrieveByKey(String codiceProdotto) throws SQLException;


	public ArrayList<Prodotto> doRetrieveAll(String order) throws SQLException;



	public int doUpdate(Prodotto prodotto)throws SQLException;



	public void doDelete(String idProdotto) throws SQLException;

}
