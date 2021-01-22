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
import bean.DatiSpedizione;
import model.DatiSpedizioneModel;

public class DatiSpedizioneModelDS implements DatiSpedizioneModel {

	private static DataSource ds;

	static {
		try {
			Context inizioContext=new InitialContext();
			Context envContext=(Context) inizioContext.lookup("java:comp/env");
			ds= (DataSource)envContext.lookup("jdbc/oltreilgiardino");
		} catch (NamingException e) {
			System.out.println("Errore: "+e.getMessage());
			
		}
		/*
		 * connessione
		 */
	}
	private static final String TABLE_NAME = "datispedizione";

	@Override
	public DatiSpedizione doRetrieveByKey(String email) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		DatiSpedizione dspB=new DatiSpedizione();
		String selectSQL="SELECT * FROM " + DatiSpedizioneModelDS.TABLE_NAME + "where email= ?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, dspB.getEmail());
		//preparedStatement.setString(2, dspB.getCitta());
		//	preparedStatement.setInt(3, dspB.getCap());
		//	preparedStatement.setString(4, dspB.getProvincia());

			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				dspB.setVia(rs.getString("via"));
				dspB.setCitta(rs.getString("citta"));
				dspB.setCap(rs.getInt("cap"));
				dspB.setProvincia(rs.getString("provincia"));


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
		return null;
	}

	@Override
	public ArrayList<DatiSpedizione> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<DatiSpedizione> datiSped = new ArrayList<DatiSpedizione>();

		String selectSQL = "SELECT * FROM " + DatiSpedizioneModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				DatiSpedizione dspB = new DatiSpedizione();
				dspB.setVia(rs.getString("via"));
				dspB.setCitta(rs.getString("citta"));
				dspB.setCap(rs.getInt("cap"));
				dspB.setProvincia(rs.getString("provincia"));
				dspB.setEmail(rs.getString("email"));
				
				datiSped.add(dspB);
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

		return datiSped;

	}


	@Override
	public void doDelete(String via, String citta, int cap, String provincia) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String deleteSQL="DELETE FROM"+ DatiSpedizioneModelDS.TABLE_NAME+"where via=?,citta=?,cap=?,provincia=?";
		try {
			try {

				connection=ds.getConnection();
				preparedStatement=connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, via);
				preparedStatement.setString(2,citta);
				preparedStatement.setInt(3, cap);
				preparedStatement.setString(4, provincia);
			}catch(SQLException e) {
				e.printStackTrace();
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


	}

	@Override
	public void doSave(DatiSpedizione dsp) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO "+ DatiSpedizioneModelDS.TABLE_NAME+"(via,citta,cap,provincia,email)"+"values(?,?,?,?,?)";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, dsp.getVia());
			preparedStatement.setString(2, dsp.getCitta());
			preparedStatement.setInt(3, dsp.getCap());
			preparedStatement.setString(4, dsp.getProvincia());
			preparedStatement.setString(5, dsp.getEmail());
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
	public int doUpdate(DatiSpedizione dsp) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+DatiSpedizioneModelDS.TABLE_NAME+"set via=?,citta=?,cap=?,provincia=?,email=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, dsp.getVia());
			preparedStatement.setString(2, dsp.getCitta());
			preparedStatement.setInt(3, dsp.getCap());
			preparedStatement.setString(4, dsp.getProvincia());
			preparedStatement.setString(5, dsp.getEmail());

			result=preparedStatement.executeUpdate();

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
