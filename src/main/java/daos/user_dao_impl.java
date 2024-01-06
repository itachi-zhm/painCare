package daos;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.user;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


public class user_dao_impl implements user_dao{
	
	private dao_factory dao_factory;
	
	public user_dao_impl(dao_factory dao_factory) {
        this.dao_factory = dao_factory;
    }
	
	//----------------------Fonction pour hacher un mot de passe
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] passwordBytes = password.getBytes();
            byte[] hashBytes = md.digest(passwordBytes);

            StringBuilder hexHash = new StringBuilder();
            for (byte b : hashBytes) {
                hexHash.append(String.format("%02x", b));
            }

            return hexHash.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

	@Override
	public void register(user utilisateur) {
		// TODO Auto-generated method stub
		
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		String query_utilisateur = "INSERT INTO users (name, email, password) VALUES (?, ?, ?);";
		try {
			connexion = dao_factory.getConnection();
			preparedStatement = connexion.prepareStatement(query_utilisateur, PreparedStatement.RETURN_GENERATED_KEYS);
            // Hacher le mot de passe avant de l'insérer
            String hashedPassword = hashPassword(utilisateur.getPassword());
            preparedStatement.setString(1, utilisateur.getName());
            preparedStatement.setString(2, utilisateur.getEmail());
            preparedStatement.setString(3, hashedPassword); // Utiliser le mot de passe haché
          
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
	}
	
	private static user getBean(ResultSet res) throws SQLException {
    	user bean = new user();
    	
    	bean.setId(res.getInt("id"));
    	bean.setName(res.getString("name"));
    	bean.setAvatar(res.getString("avatar"));
    	bean.setBirthDay(res.getDate("birthDay"));
    	bean.setEmail(res.getString("email"));
    	
    	return bean;
    }

	@Override
	public user login(String email, String password) {
		// TODO Auto-generated method stub
		Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    user utilisateur = null;

	    String query = "SELECT * FROM users WHERE email = ? AND password = ?";

	    try {
	        connexion = dao_factory.getConnection();
	        preparedStatement = connexion.prepareStatement(query);

	        preparedStatement.setString(1, email);
	        preparedStatement.setString(2, hashPassword(password)); // Hacher le mot de passe pour la comparaison
	        resultSet = preparedStatement.executeQuery();
	        if (resultSet.next()) {
	        	utilisateur = getBean(resultSet);
	        }
	     } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        
	    }
		
		return utilisateur;
	}

	@Override
	public void update(user utilisateur) throws SQLException{
		// TODO Auto-generated method stub
		Connection connexion = null;
	    PreparedStatement preparedStatement = null;
	    String query_utilisateur = "UPDATE users SET name = ?, email = ?, avatar = ?, birthDay = ? WHERE id = ?;";
	    try {
	        connexion = dao_factory.getConnection();
	        preparedStatement = connexion.prepareStatement(query_utilisateur, PreparedStatement.RETURN_GENERATED_KEYS);
     
            preparedStatement.setString(1, utilisateur.getName());
            preparedStatement.setString(2, utilisateur.getEmail());
            preparedStatement.setString(3, utilisateur.getAvatar());
            preparedStatement.setDate(4, utilisateur.getBirthDay());
            preparedStatement.setInt(5, utilisateur.getId());
            preparedStatement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        
	    }
	    
	}
	
	public user get_session(HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	user bean = (user) session.getAttribute("user");
    	
    	return bean;
    }

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		try {
			connexion = dao_factory.getConnection();
	        preparedStatement = connexion.prepareStatement("DELETE FROM users WHERE id = ?;");
	        preparedStatement.setInt(1, id);
	        preparedStatement.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Gérer l'exception de manière appropriée
	        }
	}
		
	
	
	
	
	
	
	
	
	

    

}
