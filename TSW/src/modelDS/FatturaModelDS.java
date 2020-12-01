package modelDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import bean.Fattura;
import model.FatturaModel;

public class FatturaModelDS implements FatturaModel {
	private static DataSource ds;
	
	static {
		/*
		 * connessione database
		 */
	}
	
	private static final String TABLE_NAME="fattura";

	@Override
	public void doSave(Fattura fattura) throws SQLException {
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String insertSQl="INSERT INTO"+FatturaModelDS.TABLE_NAME+"(idFattura,codiceOrdine)+values(?,?)";
		try {
			
			connection=ds.getConnection();
			preparedStatement.setString(1, fattura.getIdFattura());
			preparedStatement.setString(2, fattura.getCodiceOrdine());
			
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
	public Fattura doRetrieveByKey(String idFattura)  throws SQLException {
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		Fattura fatturaBean=new Fattura();
		String selectSQL="SELECT * FROM "+FatturaModelDS.TABLE_NAME+"where idFattura=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idFattura);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				fatturaBean.setIdFattura(rs.getString("idFattura"));
				fatturaBean.setCodiceOrdine(rs.getString("codiceOrdine"));
			}
		}finally {
			try {
				if(preparedStatement!=null)
					preparedStatement.close();
			}finally {
				if(connection!=null)
					connection.close();
			}

			
		}
		return fatturaBean;
	}

	@Override
	public ArrayList<Fattura> doRetrieveAll(String order) throws SQLException {
		//lo tralasciamo
		return null;
	}

}
