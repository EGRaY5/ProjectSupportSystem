package com.projectsupport.controls;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.projectsupport.models.Supervisor;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.SupervisorServices;

@WebServlet("/DoViewSupervisorDetails")
public class DoViewSupervisorDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DoViewSupervisorDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		String supervisorId=null;
		User currentUser = MyUtils.getLoginedUser(session);
		if (currentUser == null) {
			//System.out.println("hiiii yi");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		String user1 = currentUser.getUserName();

		//System.out.println(user1);
		//System.out.println("hiiii");
		
		if(user1.equals("pro01")){
			//supervisorId = Integer.parseInt((String) request.getSession().getAttribute("supervisorID"));
		} else {
			supervisorId = currentUser.getUserName();
		}
		String errorString = null;
		Supervisor supervisor = null;
		try {
			supervisor = SupervisorServices.viewSupervisor(conn, supervisorId);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(supervisor);
		request.setAttribute("errorString", errorString);
		request.setAttribute("supervisorDetails", supervisor);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
