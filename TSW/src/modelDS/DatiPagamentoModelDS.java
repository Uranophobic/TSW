package modelDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import bean.DatiPagamento;
import bean.DatiSpedizione;
import model.DatiPagamentoModel;

public class DatiPagamentoModelDS  implements DatiPagamentoModel{
	private static DataSource ds;
	static {
		/*
		 * connessione
		 */
	}
	private static final String TABLE_NAME = "datipagamento";
	@Override
	public void doSave(DatiPagamento dp) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO"+DatiPagamentoModelDS.TABLE_NAME+"(numeroCarta,emailUtente,circuito,scadenzaCarta,CVV)"+
				"values(?,?,?,?,?)";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, dp.getNumeroCarta());
			preparedStatement.setString(2, dp.getEmail());
			preparedStatement.setString(3, dp.getCircuito());
			preparedStatement.setString(4, dp.getScadenzaCarta());
			preparedStatement.setInt(5, dp.getCVV());
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
	public ArrayList<DatiPagamento> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<DatiPagamento> datiPag = new ArrayList<DatiPagamento>();

		String selectSQL = "SELECT * FROM " + DatiPagamentoModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				DatiPagamento dpBean=new DatiPagamento();

				dpBean.setNumeroCarta(rs.getString("numeroCarta"));
				dpBean.setEmail(rs.getString("emailUtente"));
				dpBean.setCircuito(rs.getString("circuito"));
				dpBean.setScadenzaCarta(rs.getString("scadenzaCarta"));
				dpBean.setCVV(rs.getInt("CVV"));



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

		return datiPag;

	}


	@Override
	public int doUpdate(DatiPagamento dp) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+DatiPagamentoModelDS.TABLE_NAME+"set numeroCarta=?,emailUtente=?,circuito=?,scandenzaCarta=?,CVV=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, dp.getNumeroCarta());
			preparedStatement.setString(2, dp.getEmail());
			preparedStatement.setString(3, dp.getCircuito());
			preparedStatement.setString(4, dp.getScadenzaCarta());
			preparedStatement.setInt(5, dp.getCVV());

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




	@Override
	public DatiPagamento doRetrieveByKey(String numeroCarta) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		DatiPagamento dpBean=new DatiPagamento();
		String selectSQL="SELECT * FROM"+DatiPagamentoModelDS.TABLE_NAME+"where numeroCarta=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,numeroCarta);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next()) {
				dpBean.setNumeroCarta(rs.getString("numeroCarta"));
				dpBean.setEmail(rs.getString("emailUtente"));
				dpBean.setCircuito(rs.getString("circuito"));
				dpBean.setScadenzaCarta(rs.getString("scadenzaCarta"));
				dpBean.setCVV(rs.getInt("CVV"));

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
		return dpBean;
	}


	@Override
	public void doDelete(String numeroCarta) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String deleteSQL="DELETE FROM"+DatiPagamentoModelDS.TABLE_NAME+"where numeroCarta=?";
		try {
			try {
				connection=ds.getConnection();
				preparedStatement=connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, numeroCarta);
				preparedStatement.executeUpdate();


			}catch(SQLException e){
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

}


