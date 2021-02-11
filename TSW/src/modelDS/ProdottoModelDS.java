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
import bean.Prodotto;
import model.ProdottoModel;

public class ProdottoModelDS implements ProdottoModel {

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

	private static final String TABLE_NAME = "prodotto";

	@Override
	public void doSave(Prodotto prodotto) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO "+ ProdottoModelDS.TABLE_NAME +" (idProdotto, immaginePath, nome, descrizione, categoria, prezzo, iva, sconto) "+" values(?,?,?,?,?,?,?,?) ";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, prodotto.getIdProdotto());
			preparedStatement.setString(2, prodotto.getImmaginePath());
			preparedStatement.setString(3, prodotto.getNome());
			preparedStatement.setString(4, prodotto.getDescrizione());
			preparedStatement.setString(5, prodotto.getCategoria());
			preparedStatement.setDouble(6, prodotto.getPrezzo());
			preparedStatement.setDouble(7, prodotto.getIva());
			preparedStatement.setDouble(8, prodotto.getSconto());

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
	public Prodotto doRetrieveByKey(String codiceProdotto) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		Prodotto prodottoBean=new Prodotto();

		String selectSQL="SELECT * FROM " +ProdottoModelDS.TABLE_NAME+ " WHERE idProdotto = ? ";

		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, codiceProdotto);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next())
			{
				prodottoBean.setIdProdotto(rs.getString("idProdotto"));
				prodottoBean.setImmaginePath(rs.getString("immaginePath"));
				prodottoBean.setNome(rs.getString("nome"));
				prodottoBean.setDescrizione(rs.getString("descrizione"));
				prodottoBean.setCategoria(rs.getString("categoria"));
				prodottoBean.setPrezzo(rs.getDouble("prezzo"));
				prodottoBean.setIva(rs.getDouble("iva"));
				prodottoBean.setSconto(rs.getDouble("sconto"));
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

		return prodottoBean;
	}

	@Override
	public ArrayList<Prodotto> doRetrieveAll(String order) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Prodotto> prodott = new ArrayList<Prodotto>();

		String selectSQL = "SELECT * FROM " + ProdottoModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				Prodotto prodottoBean = new Prodotto();

				prodottoBean.setIdProdotto(rs.getString("idProdotto"));
				prodottoBean.setImmaginePath(rs.getString("immaginePath"));
				prodottoBean.setNome(rs.getString("nome"));
				prodottoBean.setDescrizione(rs.getString("descrizione"));
				prodottoBean.setCategoria(rs.getString("categoria"));
				prodottoBean.setPrezzo(rs.getDouble("prezzo"));
				prodottoBean.setIva(rs.getDouble("iva"));
				prodottoBean.setSconto(rs.getDouble("sconto"));
		


				prodott.add(prodottoBean);
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

		return prodott;


	}

	@Override
	public int doUpdate(Prodotto prodotto) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE "+ProdottoModelDS.TABLE_NAME+ " SET immaginePath = ?, nome = ?, descrizione = ?, categoria = ?, prezzo = ?, iva = ?, sconto = ?"+"WHERE idProdotto = ? ";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, prodotto.getImmaginePath());
			preparedStatement.setString(2, prodotto.getNome());
			preparedStatement.setString(3, prodotto.getDescrizione());
			preparedStatement.setString(4,prodotto.getCategoria());
			preparedStatement.setDouble(5, prodotto.getPrezzo());
			preparedStatement.setDouble(6, prodotto.getIva());
			preparedStatement.setDouble(7, prodotto.getSconto());
			preparedStatement.setString(8, prodotto.getIdProdotto());

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
	public void doDelete(String idProdotto) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String deleteSQL="DELETE FROM "+ProdottoModelDS.TABLE_NAME+ " WHERE idProdotto = ? ";
		try {
			try {
				connection=ds.getConnection();
				preparedStatement=connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, idProdotto);
				preparedStatement.executeUpdate();
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

}