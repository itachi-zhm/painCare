package servlets.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.post;
import beans.user;
import daos.dao_factory;
import daos.user_dao;
import daos.post.post_dao;

/**
 * Servlet implementation class post_details
 */
@WebServlet(name="post_details", value= {"/post_details"})
public class post_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao userDAO;
	private post_dao postDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	public void init() throws ServletException {
		dao_factory daoFactory = dao_factory.getInstance();
		this.userDAO = daoFactory.get_user_dao();
		this.postDAO = daoFactory.get_post_dao();
	}
    public post_details() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
user userBean = userDAO.get_session(request);
		
		if(userBean == null) {
			response.sendRedirect("login");
			return;
		}
		String id = request.getParameter("post_id");
		post post = postDAO.one(Integer.parseInt(id));
		
		request.setAttribute("post", post);
		getServletContext().getRequestDispatcher("/WEB-INF/post/post_details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
