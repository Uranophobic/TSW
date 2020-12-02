package modelDS;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import bean.Ordine;
import model.OrdineModel;
public class OrdineModelDS implements OrdineModel{
	/*
	 * FAI DO RETREIVE ALL
	 */
	private static DataSource ds;
	static {
		/*
		 * CONNESSIONE DB
		 */
	}
	private static final String TABLE_NAME = "ordine";


	@Override
	public void doSave(Ordine ordine) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;

		String insertSQL="INSERT INTO"+OrdineModelDS.TABLE_NAME+"(idOrdine,emailUtente,dataOrdine,importoTotale)"+
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
	public Ordine doRetrieveByKey(String codiceOrdine) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		Ordine OrdineBean=new Ordine();
		String selectSQL="SELECT*FROM "+OrdineModelDS.TABLE_NAME+"where codiceOrdine=?";
		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, codiceOrdine);
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
		/*
		 * Lo tralasciamo
		 */
		return null;
	}

	@Override
	public int doUpdate(Ordine ordine) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+OrdineModelDS.TABLE_NAME+"SET idOrdine=?,emailUtente=?,dataOrdine=?,importoTotale=?";
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