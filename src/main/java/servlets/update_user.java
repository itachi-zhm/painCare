package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import daos.dao_factory;
import daos.user_dao;
import java.time.LocalDate;

import beans.user;
/**
 * Servlet implementation class upadate_user
 */
public class update_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao utilisateur_dao;
	public void init() throws ServletException {
    	dao_factory dao_Factory = dao_factory.getInstance();
        this.utilisateur_dao = dao_Factory.get_user_dao();
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/user/update.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user utilisateur = utilisateur_dao.get_session(request);
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String birthDay = request.getParameter("birthDay");
		// convert birthday date to sql date
		LocalDate localDate = LocalDate.parse(birthDay);
		Date sqlDate = java.sql.Date.valueOf(localDate);
		
		utilisateur.setName(username);
		utilisateur.setEmail(email);
		utilisateur.setBirthDay(sqlDate);
		utilisateur.setAvatar("ddddddddd");        
		try {
			utilisateur_dao.update(utilisateur);
			response.sendRedirect("home");
		} catch (SQLException e) {
			e.printStackTrace();
			response.setStatus(500);
			response.getWriter().write(e.getMessage());
		}
		
	}

}
