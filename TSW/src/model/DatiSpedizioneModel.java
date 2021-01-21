package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.DatiSpedizione;

public interface DatiSpedizioneModel {

	public void doSave(DatiSpedizione dsp) throws SQLException;


	public DatiSpedizione doRetrieveByKey(String email) throws SQLException;


	public ArrayList<DatiSpedizione> doRetrieveAll(String order) throws SQLException;



	public int doUpdate(DatiSpedizione dsp)throws SQLException;



	public void doDelete(String  via, String citta, int cap, String provincia) throws SQLException;


}
