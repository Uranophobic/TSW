package modelDS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import bean.Utente;
import model.UtenteModel;

public class UtenteModelDS implements UtenteModel {
	/*
	 * FAI DO RETREIVE ALL
	 */
	private static DataSource ds;
	static {
		/*
		 * CONNESSIONE DB
		 */
	}
	private static final String TABLE_NAME = "utente";

	@Override
	public void doSave(Utente utente) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;


		String insertSQL="INSERT INTO"+UtenteModelDS.TABLE_NAME+"(email,password,nome,cognome,dataDiNascita)"+ "values(?,?,?,?,?)";

		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getEmail());
			preparedStatement.setString(2, utente.getPassword());
			preparedStatement.setString(3, utente.getNome());
			preparedStatement.setString(4, utente.getCognome());
			preparedStatement.setString(5, utente.getDataDiNascita());

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
	public Utente doRetrieveByKey(String email) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;

		Utente utenteBean=new Utente();
		String selectSQL="SELECT * FROM"+UtenteModelDS.TABLE_NAME +" where email=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);

			preparedStatement.setString(1, email);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				utenteBean.setEmail(rs.getString("email"));
				utenteBean.setPassword(rs.getString("password"));
				utenteBean.setNome(rs.getString("nome"));
				utenteBean.setCognome(rs.getString("cognome"));
				utenteBean.setDataDiNascita(rs.getString("dataDiNascita"));
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
		return utenteBean;
	}

	@Override
	public ArrayList<Utente> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub

		/*
		 * Questo per il momento lo lasciamo perch� non sono sicura
		 */
		return null;
	}

	@Override
	public int doUpdate(Utente utente) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+UtenteModelDS.TABLE_NAME+ "SET password=?, nome=?, cognome=?, dataDiNascita=?"+"where email=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);

			preparedStatement.setString(1,utente.getPassword());
			preparedStatement.setString(2,utente.getNome());
			preparedStatement.setString(3,utente.getCognome());
			preparedStatement.setString(4,utente.getDataDiNascita());

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