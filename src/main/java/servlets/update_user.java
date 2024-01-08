package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import jakarta.servlet.http.Part;

import beans.user;
/**
 * Servlet implementation class upadate_user
 */
@WebServlet(name="update_user", value= {"/update_user"})
@MultipartConfig
public class update_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private user_dao utilisateur_dao;
	//C:/Users/Chacrone/Desktop/MoumaneProject/painCare/src/main/webapp
	//C:/Users/zoube/eclipse-workspace/painCare/src/main/webapp/
	private static final String WEB_CONTENT_DIR   = "C:/Users/Chacrone/Desktop/MoumaneProject/painCare/src/main/webapp";
	private static final String AVATARS_DIR = "assets/avatars/";
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
    //--------------------upload image
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
		String uploadPath = WEB_CONTENT_DIR + AVATARS_DIR + id + "." + ext;
				
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
        
        return AVATARS_DIR + id + "." + ext;
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		user user = utilisateur_dao.get_session(request);
		if(user == null) {
			request.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(request, response);
			return;
		}
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
		Part image = request.getPart("avatar");
		// convert birthday date to sql date
		LocalDate localDate = LocalDate.parse(birthDay);
		Date sqlDate = java.sql.Date.valueOf(localDate);
		
		// save avatar in our avatars folder
		String avatar = savePart(image);
		
		utilisateur.setName(username);
		utilisateur.setEmail(email);
		utilisateur.setBirthDay(sqlDate);
		utilisateur.setAvatar(avatar);        
		try {
			utilisateur_dao.update(utilisateur);
			response.sendRedirect("home_page");
		} catch (SQLException e) {
			e.printStackTrace();
			response.setStatus(500);
			response.getWriter().write(e.getMessage());
		}
		
	}

}
