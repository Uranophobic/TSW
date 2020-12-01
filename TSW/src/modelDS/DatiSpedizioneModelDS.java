package modelDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import bean.DatiSpedizione;
import model.DatiSpedizioneModel;

public class DatiSpedizioneModelDS implements DatiSpedizioneModel {
	
	private static DataSource ds;
	/*
	 * fai do retrive all controlla tutto
	 */
	static {
		/*
		 * connessione
		 */
	}
	private static final String TABLE_NAME = "datispedizione";

	@Override
	public DatiSpedizione doRetrieveByKey(String via, String citta, int cap, String provincia) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		DatiSpedizione dspB=new DatiSpedizione();
		String selectSQL="SELECT * FROM "+DatiSpedizioneModelDS.TABLE_NAME+"where via=?,citta=?,cap=?,provincia=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, dspB.getVia());
			preparedStatement.setString(2, dspB.getCitta());
			preparedStatement.setInt(3, dspB.getCap());
			preparedStatement.setString(4, dspB.getProvincia());
			
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
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public void doDelete(String via, String citta, int cap, String provincia) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String deleteSQL="DELETE FROM"+ DatiSpedizioneModelDS.TABLE_NAME+"where via=?,citta=?,cap=?,provincia=?";
		try {
			/*
			 * un try non è andato
			 */
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, via);
			preparedStatement.setString(2,citta);
			preparedStatement.setInt(3, cap);
			preparedStatement.setString(4, provincia);
			
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
		
		String insertSQL="INSERT INTO"+ DatiSpedizioneModelDS.TABLE_NAME+"(via,citta,cap,prov,email)"+"values(?,?,?,?,?)";
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
