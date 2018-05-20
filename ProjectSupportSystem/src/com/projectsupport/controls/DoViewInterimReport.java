package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.projectsupport.models.InterimReport;
import com.projectsupport.models.User;
import com.projectsupport.services.InterimReportServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class DoViewInterimReport
 */
@WebServlet("/DoViewInterimReport")
public class DoViewInterimReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewInterimReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// retrieve submitted progress report and 
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		int studentId;
		User currentUser = MyUtils.getLoginedUser(session);
		if (currentUser == null) {
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		String user1 = currentUser.getUserName();

		System.out.println(user1);
		try{
			//
			studentId = Integer.parseInt(currentUser.getUserName());
		}catch(Exception e){
			studentId = Integer.parseInt((String) request.getSession().getAttribute("studentID"));
		}
		String errorString = null;
		InterimReport interim = null;
		try {
			interim = InterimReportServices.findInterimReport(conn, studentId);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(interim);
		request.setAttribute("errorString", errorString);
		request.setAttribute("interim",interim);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
