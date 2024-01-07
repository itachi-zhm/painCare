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
	public void update(post post) {
		// TODO Auto-generated method stub
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		String query_post = "UPDATE posts SET title = ?, description = ?, image = ? WHERE id = ?;";
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query_post);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getDescription()); 
            preparedStatement.setString(3, post.getImage()); 
            preparedStatement.setInt(4, post.getId()); 
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public void delete(int post_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<post> all() {
		// TODO Auto-generated method stub
		Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    ArrayList<post> list = new ArrayList<post>();
	    String query ="SELECT posts.*, users.name AS user_name FROM posts JOIN users ON posts.user_id = users.id ORDER BY id DESC;";
	    try { 
	    	connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();

	    	while(resultSet.next()) 
	    		list.add(getBean(resultSet));
	    	
	    } catch (SQLException e) {
         e.printStackTrace();
	    }
	    
	    return list;
	}

	@Override
	public post one(int post_id) {
		// TODO Auto-generated method stub
		Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    post bean=null;
	    String query ="SELECT posts.*, users.name AS user_name FROM posts JOIN users ON posts.user_id = users.id WHERE posts.id = ?;";
	    try { 
	    	connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query);
			preparedStatement.setInt(1, post_id);
			resultSet = preparedStatement.executeQuery();
			bean = resultSet.next() ? getBean(resultSet) : null;
	    	
	    } catch (SQLException e) {
         e.printStackTrace();
	    }
	    
	    return bean;
	}

}
