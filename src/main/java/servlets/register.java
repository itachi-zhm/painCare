package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import beans.user;
import daos.dao_factory;
import daos.user_dao;


/**
 * Servlet implementation class register
 */
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao utilisateur_dao;
	public void init() throws ServletException {
    	dao_factory dao_Factory = dao_factory.getInstance();
        this.utilisateur_dao = dao_Factory.get_user_dao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/user/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		
		if(!password.equals(password2)) {
			request.setAttribute("erreurMessage", "les deux mot de passe ne sont pas identiques");
			request.getRequestDispatcher("/WEB-INF/user/register.jsp").forward(request, response);
			return;
		}
		
		user utilisateur = new user();
		utilisateur.setName(username);
		utilisateur.setEmail(email);
		utilisateur.setPassword(password);
		
		utilisateur_dao.register(utilisateur);
		response.sendRedirect("login");
	}

}
