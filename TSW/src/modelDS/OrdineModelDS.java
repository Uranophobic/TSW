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
import bean.Ordine;
import model.OrdineModel;
public class OrdineModelDS implements OrdineModel{

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
	private static final String TABLE_NAME = "ordine";


	@Override
	public void doSave(Ordine ordine) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO "+OrdineModelDS.TABLE_NAME+"(idOrdine,emailUtente,dataOrdine,importoTotale)"+
				"values(?,?,?,?)";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, ordine.getIdOrdine());
			preparedStatement.setString(2,ordine.getEmailUtente());
			preparedStatement.setString(3, ordine.getDataOrdine());
			preparedStatement.setDouble(4, ordine.getImportoTot());
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
	public Ordine doRetrieveByKey(String idOrdine) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		Ordine OrdineBean=new Ordine();
		String selectSQL="SELECT * FROM "+OrdineModelDS.TABLE_NAME+ " where idOrdine=? ";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idOrdine);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				OrdineBean.setIdOrdine(rs.getString("idOrdine"));
				OrdineBean.setEmailUtente(rs.getString("emailUtente"));
				OrdineBean.setDataOrdine(rs.getString("dataOrdine"));
				OrdineBean.setImportoTot(rs.getDouble("importoTotale"));
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
		return OrdineBean;
	}

	@Override
	public ArrayList<Ordine> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Ordine> ordine = new ArrayList<Ordine>();

		String selectSQL = "SELECT * FROM " + OrdineModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Ordine ordineBean = new Ordine();

				ordineBean.setIdOrdine(rs.getString("idOrdine"));
				ordineBean.setEmailUtente(rs.getString("emailUtente"));
				ordineBean.setImportoTot(rs.getDouble("importoTotale"));
				ordineBean.setDataOrdine(rs.getString("DataOrdine"));

				ordine.add(ordineBean);
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

		return ordine;

	}





	@Override
	public int doUpdate(Ordine ordine) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE "+OrdineModelDS.TABLE_NAME + "SET idOrdine = ?, emailUtente = ?, dataOrdine = ?, importoTotale = ?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, ordine.getIdOrdine());
			preparedStatement.setString(2, ordine.getEmailUtente());
			preparedStatement.setString(3, ordine.getDataOrdine());
			preparedStatement.setDouble(4, ordine.getImportoTot());

		}finally {
			try {
				if(preparedStatement!=null)
					preparedStatement.close();
			}finally {
				if(connection!=null)
					connection.close();
			}

		}
		return result;
	}

}
