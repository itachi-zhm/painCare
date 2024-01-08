package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

import beans.painBean;
import beans.testBean;
import beans.user;
import daos.dao_factory;
import daos.user_dao;
import daos.painDao.painDao;
import daos.painDao.painDaoImpl;
import daos.painDao.painTestDao;
import daos.painDao.painTestDaoImpl;

/**
 * Servlet implementation class home_page
 */
@WebServlet(name="home_page", value= {"/dashboard"})
public class home_page extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private painDao pain_dao;
	private painTestDao pain_test_dao;
	private user_dao utilisateur_dao;
	public void init() throws ServletException {
    	dao_factory dao_Factory = dao_factory.getInstance();
        this.pain_dao=new painDaoImpl(dao_Factory);
        this.pain_test_dao=new painTestDaoImpl(dao_Factory);
        this.utilisateur_dao = dao_Factory.get_user_dao();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public home_page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubid
		user user = utilisateur_dao.get_session(request);
		if(user == null) {
			request.getRequestDispatcher("/WEB-INF/user/login.jsp").forward(request, response);
			return;
		}
		ArrayList<painBean> pains = pain_dao.getAllPains(user.getId());
        testBean test = pain_test_dao.find(user.getId());
        ArrayList<Integer> data1 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0,0));
        ArrayList<Integer> data2 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0,0,0));
        ArrayList<Integer> data3 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0,0,0));
        ArrayList<Integer> data4 = new ArrayList<>(Arrays.asList(0, 0, 0, 0, 0));
        ArrayList<Object> data5 = new ArrayList<>();
        ArrayList<ArrayList<Object>> data = new ArrayList<>();
        Random random = new Random();
        if(test != null ) {
            switch (test.getResult()) {
                case "Low":
                    int randomNumber = random.nextInt(30 + 1);
                    data5.add("Low");
                    data5.add(randomNumber);
                    break;
                case "Moderate":
                    int randomNumber1 = random.nextInt(60 - 31 + 1) + 31;
                    data5.add("Moderate");
                    data5.add(randomNumber1);
                    break;
                case "High":
                    int randomNumber2 = random.nextInt(100 - 61 + 1) + 61;
                    data5.add("High");
                    data5.add(randomNumber2);
                    break;
            }
            System.out.println(data5);
        }

        if(pains != null){
            System.out.println("heeree");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            for (int i = 0; i < pains.size(); i++) {
                ArrayList<Object> p = new ArrayList<>();
                p.add(dateFormat.format(pains.get(i).getCreated_at()));
                p.add(pains.get(i).getLevel());
                data.add(p);

                switch (pains.get(i).getLocation()) {
                    case "abdomen":
                        data1.set(0, data1.get(0) + 1);
                        break;
                    case "back":
                        data1.set(1, data1.get(1) + 1);
                        break;
                    case "chest":
                        data1.set(2, data1.get(2) + 1);
                        break;
                    case "head":
                        data1.set(3, data1.get(3) + 1);
                        break;
                    case "neck":
                        data1.set(4, data1.get(4) + 1);
                        break;
                    case "hips":
                        data1.set(5, data1.get(5) + 1);
                        break;
                }
                switch (pains.get(i).getSymptoms()) {
                    case "cramps":
                        data2.set(0, data2.get(0) + 1);
                        break;
                    case "tenderBreasts":
                        data2.set(1, data2.get(1) + 1);
                        break;
                    case "headache":
                        data2.set(2, data2.get(2) + 1);
                        break;
                    case "acne":
                        data2.set(3, data2.get(3) + 1);
                        break;
                    case "fatigue":
                        data2.set(4, data2.get(4) + 1);
                        break;
                    case "bloating":
                        data2.set(5, data2.get(5) + 1);
                        break;
                    case "craving":
                        data2.set(6, data2.get(6) + 1);
                        break;
                }
                switch (pains.get(i).getPainWorse()) {
                    case "lackOfSleep":
                        data3.set(0, data3.get(0) + 1);
                        break;
                    case "sitting":
                        data3.set(1, data3.get(1) + 1);
                        break;
                    case "standing":
                        data3.set(2, data3.get(2) + 1);
                        break;
                    case "stress":
                        data3.set(3, data3.get(3) + 1);
                        break;
                    case "walking":
                        data3.set(4, data3.get(4) + 1);
                        break;
                    case "exercise":
                        data3.set(5, data3.get(5) + 1);
                        break;
                    case "urination":
                        data3.set(6, data3.get(6) + 1);
                        break;
                }
                switch (pains.get(i).getFeeling()) {
                    case "anxious":
                        data4.set(0, data4.get(0) + 1);
                        break;
                    case "depressed":
                        data4.set(1, data4.get(1) + 1);
                        break;
                    case "dizzy":
                        data4.set(2, data4.get(2) + 1);
                        break;
                    case "vomiting":
                        data4.set(3, data4.get(3) + 1);
                        break;
                    case "diarrhea":
                        data4.set(4, data4.get(4) + 1);
                        break;
                }

            }
        }

        request.setAttribute("data1", data1);
        request.setAttribute("data2", data2);
        request.setAttribute("data3", data3);
        request.setAttribute("data4", data4);
        request.setAttribute("data5", data5);
        request.setAttribute("data", data);
        
		request.getRequestDispatcher("/WEB-INF/user/dashboard.jsp").forward(request, response);
		//dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
