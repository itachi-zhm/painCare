package daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import daos.post.post_dao;
import daos.post.post_dao_impl;



public class dao_factory {
	private String url;
    private String username;
    private String password;

    dao_factory(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public static dao_factory getInstance() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {

        }

        dao_factory instance = new dao_factory(
                "jdbc:mysql://localhost:3306/paincare", "root", "");
        return instance;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
    
    // Récupération du Dao
    public user_dao get_user_dao() {
        return new user_dao_impl(this);
    }
    
    public post_dao get_post_dao() {
        return new post_dao_impl(this);
    }
    
}
