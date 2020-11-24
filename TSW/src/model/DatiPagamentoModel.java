package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.DatiPagamento;

public interface DatiPagamentoModel {

	public void doSave(DatiPagamento dp) throws SQLException;



	public DatiPagamento doRetrieveByKey(int numeroCarta) throws SQLException;


	public ArrayList<DatiPagamento> doRetrieveAll(String order) throws SQLException;



	public int doUpdate(DatiPagamento dp)throws SQLException;



	public void doDelete(int numeroCarta) throws SQLException;


}
