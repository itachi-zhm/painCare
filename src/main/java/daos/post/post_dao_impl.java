package daos.post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.post;
import daos.dao_factory;

public class post_dao_impl implements post_dao{
private dao_factory dao_factory;
	
	public post_dao_impl(dao_factory dao_factory) {
        this.dao_factory = dao_factory;
    }
	
	private static post getBean(ResultSet res) throws SQLException {
    	post bean = new post();
    	
    	bean.setId(res.getInt("id"));
    	bean.setUser_id(res.getInt("user_id"));
    	bean.setTitle(res.getString("title"));
    	bean.setDescription(res.getString("description"));
    	bean.setImage(res.getString("image"));
    	bean.setDate(res.getDate("date"));
    	bean.setUser_name(res.getString("user_name"));
    	
    	return bean;
    }

	@Override
	public void create(int user_id, String title, String description, String image) {
		// TODO Auto-generated method stub
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		String query_post = "INSERT INTO posts (user_id, title, description, image) VALUES(?, ?, ?, ?);";
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query_post);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setString(2, title);
            preparedStatement.setString(3, description); 
            preparedStatement.setString(4, image); 
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public void update(post blog) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int blog_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<post> all() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public post one(int blog_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
