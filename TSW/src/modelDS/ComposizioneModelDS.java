package modelDS;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import bean.Composizione;
import model.ComposizioneModel;


public class ComposizioneModelDS implements ComposizioneModel {

	private static DataSource ds;

	static {
		
		try {
			Context inizioContext=new InitialContext();

			Context envContext=(Context) inizioContext.lookup("java:comp/env");

			ds=(DataSource) envContext.lookup("jdbc/oltreilgiardino");

		} catch (NamingException e) {

			System.out.println("Errore: "+e.getMessage());
		
		}
		
	}
	private static final String TABLE_NAME = "composizione";
	@Override
	public void doSave(Composizione composizione) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO "+ComposizioneModelDS.TABLE_NAME+"(codiceOrdine,codiceProdotto,quantita,prezzoUnitario,scontoAttuale,iva)"+
				"values(?,?,?,?,?,?)";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, composizione.getCodiceOrdine());
			preparedStatement.setString(2, composizione.getCodiceProdotto());
			preparedStatement.setInt(3, composizione.getQuantità());
			preparedStatement.setDouble(4, composizione.getPrezzoUnitario());
			preparedStatement.setDouble(5, composizione.getScontoAttuale());
			preparedStatement.setDouble(6, composizione.getIva());

			preparedStatement.executeUpdate();
			
			
		}finally {
			try {
				if(preparedStatement!=null)
					preparedStatement.close();
			}finally {
				if(connection!=null)
					connection.close();
			}

		}


	}

	@Override
	public ArrayList<Composizione> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Composizione> composizioni = new ArrayList<Composizione>();

		String selectSQL = "SELECT * FROM " + ComposizioneModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Composizione composizioneBean = new Composizione();

				composizioneBean.setCodiceProdotto(rs.getString("CodiceProdotto"));
				composizioneBean.setCodiceOrdine(rs.getString("CodiceOrdine"));
				composizioneBean.setQuantità(rs.getInt("quantita"));
				composizioneBean.setPrezzoUnitario(rs.getDouble("PrezzoUnitario"));
				composizioneBean.setScontoAttuale(rs.getInt("ScontoAttuale"));

				composizioni.add(composizioneBean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}

		return composizioni;

	}

}