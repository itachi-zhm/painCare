package daos;

import java.sql.SQLException;

import beans.user;
import jakarta.servlet.http.HttpServletRequest;

public interface user_dao {
	public void register(user utilisateur);
	public user login(String email, String password);
	public void update(user utilisateur) throws SQLException;
	public user get_session(HttpServletRequest request);
	public void delete(int id);

}
