package servlets.comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.comment;
import beans.user;
import daos.dao_factory;
import daos.user_dao;
import daos.comment.comment_dao;

/**
 * Servlet implementation class delete_comment
 */
public class delete_comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao userDAO;
	private comment_dao commentDAO;
	
	public void init() throws ServletException {
		dao_factory daoFactory = dao_factory.getInstance();
		this.userDAO = daoFactory.get_user_dao();
		this.commentDAO = daoFactory.get_comment_dao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_comment() {
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
		
		String comment_id = request.getParameter("comment_id");
		String blog_id = request.getParameter("post_id");
		
			comment comment = commentDAO.get_one(Integer.parseInt(comment_id));
			if(comment == null) {
				response.sendRedirect("post_details?post_id=" + blog_id);
				return;
			}
			
			if(comment.getUser_id() != userBean.getId()) {
				response.sendError(403);
				return;
			}
			commentDAO.delete(Integer.parseInt(comment_id));
			
			response.sendRedirect("post_details?post_id=" + blog_id);
	}
}

