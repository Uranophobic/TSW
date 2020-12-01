package modelDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import bean.Composizione;
import model.ComposizioneModel;

public class ComposizioneModelDS implements ComposizioneModel {

	private static DataSource ds;
	/*
	 * FAI DO RETRIVE ALL
	 */
	static {
		/*
		 * CONNESSIONE DB
		 */
	}
	private static final String TABLE_NAME = "composizione";
	@Override
	public void doSave(Composizione composizione) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO"+ComposizioneModelDS.TABLE_NAME+("codiceOrdine,codiceProdotto,quantità,prezzoUnitario,scontoAttuale,iva")+
				"values(?,?,?,?,?,?)";
		try {
			connection=ds.getConnection();
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
		// tralasciamo
		return null;
	}

}
