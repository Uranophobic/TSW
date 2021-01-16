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


import bean.Fattura;
import model.FatturaModel;

public class FatturaModelDS implements FatturaModel {
	private static DataSource ds;

	static {
		try {
			Context inizioContext=new InitialContext();
			Context envContext=(Context) inizioContext.lookup("java:comp/env");
			ds= (DataSource)envContext.lookup("jdbc/oltreilgiardino");
		} catch (NamingException e) {
			System.out.println("Errore: "+e.getMessage());
			
		}
		
	}

	private static final String TABLE_NAME="fattura";

	@Override
	public void doSave(Fattura fattura) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String insertSQl="INSERT INTO "+FatturaModelDS.TABLE_NAME+"(idFattura,codiceOrdine)+values(?,?)";
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
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Fattura> fatture = new ArrayList<Fattura>();

		String selectSQL = "SELECT * FROM " + FatturaModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Fattura fatturaBean = new Fattura();

				fatturaBean.setIdFattura(rs.getString("idFattura"));
				fatturaBean.setCodiceOrdine(rs.getString("codiceOrdine"));

				fatture.add(fatturaBean);
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

		return fatture;

	}


}
