package servlets.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import beans.post;
import daos.dao_factory;
import daos.user_dao;
import daos.user_dao_impl;
import daos.post.post_dao;
import daos.post.post_dao_impl;

/**
 * Servlet implementation class read_posts
 */
@WebServlet(name="read_posts", value= {"/posts"})
public class read_posts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao userDAO;
	private post_dao postDAO;
	
	public void init() throws ServletException {
		dao_factory daoFactory = dao_factory.getInstance();
		this.userDAO = daoFactory.get_user_dao();
		this.postDAO = daoFactory.get_post_dao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public read_posts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<post> posts = postDAO.all();
		request.setAttribute("posts", posts);
		getServletContext().getRequestDispatcher("/WEB-INF/post/posts.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
