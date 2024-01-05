package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import beans.user;
import daos.dao_factory;
import daos.user_dao;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao utilisateur_dao;
	public void init() throws ServletException {
    	dao_factory dao_Factory = dao_factory.getInstance();
        this.utilisateur_dao = dao_Factory.get_user_dao();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        user utilisateur= utilisateur_dao.login(email, password);

        if (utilisateur != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", utilisateur);
            request.getRequestDispatcher("/WEB-INF/user/home.jsp").forward(request, response);
        } else {
            // Afficher un message d'erreur si la connexion échoue
            request.setAttribute("erreurMessage", "Adresse e-mail ou mot de passe incorrect");
            request.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(request, response);
        }
	}

}
