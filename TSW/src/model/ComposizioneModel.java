package model;

import java.sql.SQLException;
import java.util.ArrayList;

import bean.Composizione;

public interface ComposizioneModel {

	public void doSave(Composizione composizione) throws SQLException;

	public ArrayList<Composizione> doRetrieveAll(String order) throws SQLException;

}
