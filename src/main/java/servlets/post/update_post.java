package servlets.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import beans.post;
import beans.user;
import daos.dao_factory;
import daos.user_dao;
import daos.post.post_dao;

/**
 * Servlet implementation class update_post
 */
@WebServlet(name="update_post", value= {"/update_post"})
@MultipartConfig
public class update_post extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String WEB_CONTENT_DIR   = "C:/Users/zoube/eclipse-workspace/painCare/src/main/webapp/";
	private static final String BLOGS_IMAGES_DIR = "assets/posts/";
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
	
    public update_post() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private static String getMeidaExt(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                
                return filename.substring(filename.lastIndexOf('.') + 1);
            }
        }
        return null;
    }
    
    private static String savePart(Part image) {
		long id = System.currentTimeMillis();
		String ext = getMeidaExt(image);
		String uploadPath = WEB_CONTENT_DIR + BLOGS_IMAGES_DIR + id + "." + ext;
				
        try (InputStream input = image.getInputStream();
             OutputStream output = new FileOutputStream(uploadPath)) {
        	
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        return BLOGS_IMAGES_DIR + id + "." + ext;
	}

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user userBean = userDAO.get_session(request);
		
		if(userBean == null) {
			response.sendRedirect("login");
			return;
		}
		String id = request.getParameter("id");
		post post = postDAO.one(Integer.parseInt(id));
		
		request.setAttribute("post", post);
		getServletContext().getRequestDispatcher("/WEB-INF/post/update_post.jsp").forward(request, response);
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
		
		Part image = request.getPart("image");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String id = request.getParameter("id");	
		//getServletContext().getRequestDispatcher("/WEB-INF/post/update_post.jsp").forward(request, response);
		post postBean = postDAO.one(Integer.parseInt(id));
		
		if(image == null ||  image.getSize() == 0 || title.equals("") || description.equals("")) {
			request.setAttribute("form_error", "Please fill all fields");
			request.setAttribute("post", postBean);
			return;
		}
		
		// save blog image in our blogs-images folder
		String imageLink = savePart(image);
					
		postBean.setTitle(title);
		postBean.setDescription(description);
		postBean.setImage(imageLink);
		postDAO.update(postBean);
		response.sendRedirect("posts");
	}

}
