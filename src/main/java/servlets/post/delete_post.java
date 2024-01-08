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
 * Servlet implementation class delete_post
 */
@WebServlet(name="delete_post", value= {"/delete_post"})
public class delete_post extends HttpServlet {
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
    public delete_post() {
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
		user userBean = userDAO.get_session(request);
		
		if(userBean == null) {
			response.sendRedirect("login");
			return;
		}
		
		String blog_id = request.getParameter("post_id");
		
			post blog = postDAO.one(Integer.parseInt(blog_id));
			
			if(blog == null) {
				response.sendRedirect("read_posts");
				return;
			}
			
			if(blog.getUser_id() != userBean.getId()) {
				response.sendError(403);
				return;
			}
			
			postDAO.delete(Integer.parseInt(blog_id));
			
			response.sendRedirect("read_posts");
	}

}
