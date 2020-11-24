package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.DatiSpedizione;

public interface DatiSpedizioneModel {

	public void doSave(DatiSpedizione ds) throws SQLException;


	public DatiSpedizione doRetrieveByKey(String via, String citta, int cap, String provincia) throws SQLException;


	public ArrayList<DatiSpedizione> doRetrieveAll(String order) throws SQLException;



	public int doUpdate(DatiSpedizione ds)throws SQLException;



	public void doDelete(String  via, String citta, int cap, String provincia) throws SQLException;


}
