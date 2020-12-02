package modelDS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import bean.Prodotto;
import model.ProdottoModel;

public class ProdottoModelDS implements ProdottoModel {
	/*
	 * FAI DO RETREIVE ALL
	 */
	private static DataSource ds;

	static {
		/*
		 * connessione db
		 */
	}

	private static final String TABLE_NAME = "prodotto";

	@Override
	public void doSave(Prodotto prodotto) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO"+ ProdottoModelDS.TABLE_NAME+"(idProdotto,immaginePath,nome,descrizione,categoria,prezzo,iva,sconto)"+"values(?,?,?,?,?,?,?,?)";
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

		String selectSQL="SELECT * FROM"+ProdottoModelDS.TABLE_NAME+"where idProdotto=?";

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

		/*
		 * Questo per ora lo tralasciamo 
		 */
		return null;
	}

	@Override
	public int doUpdate(Prodotto prodotto) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+ProdottoModelDS.TABLE_NAME+"SET idProdotto=?,immaginePath=?,nome=?, descrizione=?,categoria=?,prezzo=?,iva=?,sconto=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, prodotto.getIdProdotto());
			preparedStatement.setString(2, prodotto.getImmaginePath());
			preparedStatement.setString(3, prodotto.getNome());
			preparedStatement.setString(4, prodotto.getDescrizione());
			preparedStatement.setString(5,prodotto.getCategoria());
			preparedStatement.setDouble(6, prodotto.getPrezzo());
			preparedStatement.setDouble(7, prodotto.getIva());
			preparedStatement.setDouble(8, prodotto.getSconto());

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
	public void doDelete(String codiceProdotto) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String deleteSQL="DELETE FROM"+ProdottoModelDS.TABLE_NAME+"where idProdotto=?";
		try {
			try {
				connection=ds.getConnection();
				preparedStatement=connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, codiceProdotto);
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