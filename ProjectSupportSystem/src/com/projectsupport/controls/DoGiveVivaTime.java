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

import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProjectPlanServices;
import com.projectsupport.services.ProjectProposalServices;

/**
 * Servlet implementation class DoGiveVivaTime
 */
@WebServlet("/DoGiveVivaTime")
public class DoGiveVivaTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoGiveVivaTime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
	        dispatcher.forward(request, response);
	        return;
		}
		
		/*String date1 = request.getParameter("day1");
		String date2 = request.getParameter("day2");
		String date3 = request.getParameter("day3");
		String time10 = request.getParameter("time01");
		String time11 = request.getParameter("time11");
		
		String time20 = request.getParameter("time20");
		String time21 = request.getParameter("time21");
		String time30 = request.getParameter("time30");
		String time31 = request.getParameter("time31");*/
	/*	String errorString = null;
		if(errorString == null){*/
	/*	try {
			ProjectProposalServices.insertProjectProposal(conn, proposal);
			ProjectPlanServices.insertProjectPlan(conn, plan);
		} catch(SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
				
		}*/
			
		
				
	/*	request.setAttribute("day1", request.getParameter("day1"));
		request.setAttribute("time10", request.getParameter("time10"));
		request.setAttribute("time11", request.getParameter("time11"));
		
		request.setAttribute("day2", request.getParameter("day2"));
		request.setAttribute("time20", request.getParameter("time20"));
		request.setAttribute("time21", request.getParameter("time21"));
		
		request.setAttribute("day3", request.getParameter("day3"));
		request.setAttribute("time30", request.getParameter("time30"));
		request.setAttribute("time31", request.getParameter("time31"));*/
		/*
		RequestDispatcher dispatcher = request.getRequestDispatcher("/viva.jsp");
		dispatcher.forward(request, response);*/
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
