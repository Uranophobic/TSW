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
import bean.Utente;
import model.UtenteModel; 

public class UtenteModelDS implements UtenteModel {

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
	private static final String TABLE_NAME = "utente";

	@Override
	public void doSave(Utente utente) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;


		String insertSQL="INSERT INTO "+UtenteModelDS.TABLE_NAME+"(email,password,nome,cognome,dataDiNascita,datiSpedizione,datiPagamento)"+ "values(?,?,?,?,?,?,?)";

		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getEmail());
			preparedStatement.setString(2, utente.getPassword());
			preparedStatement.setString(3, utente.getNome());
			preparedStatement.setString(4, utente.getCognome());
			preparedStatement.setString(5, utente.getDataDiNascita());
			preparedStatement.setString(6, utente.getDatiSpedizione());
			preparedStatement.setString(7, utente.getDatiPagamento());


			preparedStatement.executeUpdate();

		}finally {
			try {
				if(preparedStatement!=null)
					preparedStatement.close();
			}finally {
				if(connection!=null) {
					connection.close();


				}
			}

		}


	}

	@Override
	public Utente doRetrieveByKey(String email) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;

		Utente utenteBean=new Utente();
		String selectSQL="SELECT * FROM " + UtenteModelDS.TABLE_NAME + " where email=?";
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
				utenteBean.setDatiSpedizione(rs.getString("datiSpedizione"));
				utenteBean.setDatiPagamento(rs.getString("datiPagamento"));
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
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Utente> users = new ArrayList<Utente>();

		String selectSQL = "SELECT * FROM " + UtenteModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Utente utenteBean = new Utente();

				utenteBean.setEmail(rs.getString("email"));
				utenteBean.setPassword(rs.getString("password"));
				utenteBean.setNome(rs.getString("nome"));
				utenteBean.setCognome(rs.getString("cognome"));
				utenteBean.setDataDiNascita("dataDiNascita");
				utenteBean.setDatiSpedizione(rs.getString("datiSpedizione"));
				utenteBean.setDatiPagamento(rs.getString("datiPagamento"));


				users.add(utenteBean);
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

		return users;

	}

	@Override
	public int doUpdate(Utente utente) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL= "UPDATE "+UtenteModelDS.TABLE_NAME+ " SET password = ? , nome = ?, cognome = ?, dataDiNascita = ? , datiSpedizione = ? , datiPagamento = ? "+" WHERE email = ?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);

			preparedStatement.setString(1,utente.getPassword());
			preparedStatement.setString(2,utente.getNome());
			preparedStatement.setString(3,utente.getCognome());
			preparedStatement.setString(4,utente.getDataDiNascita());
			preparedStatement.setString(5,utente.getDatiSpedizione());
			preparedStatement.setString(6,utente.getDatiPagamento());
			preparedStatement.setString(7,utente.getEmail());
			

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
