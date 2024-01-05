package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import daos.dao_factory;
import daos.user_dao;

/**
 * Servlet implementation class delete_user
 */
public class delete_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao utilisateur_dao;
	public void init() throws ServletException {
    	dao_factory dao_Factory = dao_factory.getInstance();
        this.utilisateur_dao = dao_Factory.get_user_dao();
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_user() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));;
		utilisateur_dao.delete(id);
		
	}

}
