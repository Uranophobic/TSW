package modelDS;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import bean.Prodotto;
import bean.Wishlist;
import model.WishlistModel;

public class WishlistModelDS  implements WishlistModel{

	private static DataSource ds;

	static {
		//connessione db
	}
	private static final String TABLE_NAME = "wishlist";

	@Override
	public void doSave(Wishlist wishlist) throws SQLException {

		Connection connection=null;
		PreparedStatement preparedStatement=null;
		try {
			connection=ds.getConnection();
			String insertSQL="INSERT INTO"+ WishlistModelDS.TABLE_NAME+"(idWish,codiceProdotto)";
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, wishlist.getIdWish());
			preparedStatement.setString(2, wishlist.getCodiceProdotto());

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
	public Wishlist doRetrieveByKey(String idWish) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;

		Wishlist wishBean=new Wishlist();

		String selectSQL="SELECT * FROM"+WishlistModelDS.TABLE_NAME+"where idWish=?";

		try {
			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,idWish);
			ResultSet rs=preparedStatement.executeQuery();
			while(rs.next())
			{
				wishBean.setIdWish(rs.getString("idWish"));
				wishBean.setCodiceProdotto(rs.getString("codiceProdotto"));
			}


		}finally {
			try {
				if(preparedStatement!=null)
					preparedStatement.close();
			}finally {
				if(connection!=null)
					connection.close();
			}
			return wishBean;
		}
	}


	@Override
	public ArrayList<Wishlist> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<Wishlist> wish = new ArrayList<Wishlist>();

		String selectSQL = "SELECT * FROM " + WishlistModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {

			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Wishlist wishlistBean=new Wishlist();


				wishlistBean.setIdWish(rs.getString("idWish"));
				wishlistBean.setCodiceProdotto(rs.getString("codiceProdotto"));

				wish.add(wishlistBean);
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

		return wish;



	}

	@Override
	public int doUpdate(Wishlist wishlist) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int result=0;

		String updateSQL="UPDATE"+WishlistModelDS.TABLE_NAME+"SET idWish=?,codiceProdotto=?";
		try {

			connection=ds.getConnection();
			preparedStatement=connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, wishlist.getIdWish());
			preparedStatement.setString(2, wishlist.getCodiceProdotto());

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

	public void doDelete(String idWish) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String deleteSQL="DELETE FROM"+WishlistModelDS.TABLE_NAME+"where idWish=?";
		try {
			try {
				connection=ds.getConnection();
				preparedStatement=connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, idWish);
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


