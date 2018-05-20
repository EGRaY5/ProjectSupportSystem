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
import com.projectsupport.models.ProjectProposal;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProjectProposalServices;

/**
 * Servlet implementation class DoViewProjectProposal
 */
@WebServlet("/DoViewProjectProposal")
public class DoViewProjectProposal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewProjectProposal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//View project proposal details
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		int studentId;
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
	        dispatcher.forward(request, response);
	        return;
		}
		String user1 = currentUser.getUserName();
		
		System.out.println(user1);
		try{
			studentId = Integer.parseInt(currentUser.getUserName());
		}catch(Exception e){
			studentId = Integer.parseInt((String) request.getSession().getAttribute("studentID"));
		}
		/*if(user1.equals("pro01") || user1.equals("sup01@gmail.com")){
			
		}
		else{
			studentId = Integer.parseInt(currentUser.getUserName());
		}*/
		
		String errorString = null;
		ProjectProposal proposal = new ProjectProposal();
		//ProjectPlan plan = new ProjectPlan();
		try {
			proposal = ProjectProposalServices.findProjectProposal(conn, studentId);
			//plan = ProjectPlanServices.findProjectPlan(conn, studentId);	
			//System.out.println(plan.getStartingDate10());
			//request.setAttribute("plan", plan);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(proposal);
		//String json1 = new Gson().toJson(plan);
		//String twoJson = "["+json+","+json1+"]";
		request.setAttribute("errorString", errorString);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}
