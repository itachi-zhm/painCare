package daos.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.comment;
import daos.dao_factory;

public class comment_dao_impl implements comment_dao{
	private dao_factory dao_factory;

    public comment_dao_impl( dao_factory daoFactory ) {
        this.dao_factory = daoFactory;
    }
    
    private static comment getBean(ResultSet res, boolean user_info) throws SQLException{
    	comment bean = new comment();
    	
    	bean.setId(res.getInt("id"));
    	bean.setUser_id(res.getInt("user_id"));
    	bean.setPost_id(res.getInt("post_id"));
    	bean.setContent(res.getString("content"));
    	bean.setDate(res.getTimestamp("date"));
    	
    	if(user_info) {
        	bean.setUser_name(res.getString("user_name"));
        	bean.setAvatar(res.getString("avatar"));	
    	}
    	
    	return bean;
    }

	@Override
	public void create(int user_id, int post_id, String content) {
		// TODO Auto-generated method stub
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		String query_post = "INSERT INTO comments (user_id, post_id, content) VALUES(?, ?, ?);";
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query_post);
            preparedStatement.setInt(1, user_id);
            preparedStatement.setInt(2, post_id);
            preparedStatement.setString(3, content); 
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		
	}

	@Override
	public void delete(int comment_id) {
		// TODO Auto-generated method stub
		Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    String query = "DELETE FROM comments WHERE id = ?;";
	    try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query);
            preparedStatement.setInt(1, comment_id);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public ArrayList<comment> blogComments(int post_id) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ArrayList<comment> list = new ArrayList<comment>();
		String query = "SELECT comments.*, users.name AS user_name, users.avatar as avatar "
				+ "FROM comments "
				+ "JOIN users ON comments.user_id = users.id "
				+ "JOIN posts ON comments.post_id = posts.id "
				+ "WHERE posts.id = ? ORDER BY comments.id DESC;";;
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query);
            preparedStatement.setInt(1,post_id); 
			resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) list.add(getBean(resultSet, true));
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return list;
	}
	
	public comment get_one(int comment_id){
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		comment bean = null;
		String query ="SELECT * FROM comments WHERE id = ? ;";
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query);
            preparedStatement.setInt(1, comment_id); 
			resultSet = preparedStatement.executeQuery();
			bean = resultSet.next() ? getBean(resultSet, false) : null;
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	return bean;
    }

}
