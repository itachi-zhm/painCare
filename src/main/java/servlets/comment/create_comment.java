package servlets.comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.user;
import daos.dao_factory;
import daos.user_dao;
import daos.comment.comment_dao;

/**
 * Servlet implementation class create_comment
 */
@WebServlet(name="create_comment", value= {"/create_comment"})
public class create_comment extends HttpServlet {
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
    public create_comment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendError(404);
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
		
		String post_id = request.getParameter("post_id");
		String content = request.getParameter("comment");
		commentDAO.create(userBean.getId(), Integer.parseInt(post_id), content);
		response.sendRedirect("post_details?post_id=" + post_id);
	}

}
