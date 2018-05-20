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

import com.projectsupport.models.ProjectPlan;
import com.projectsupport.models.ProjectProposal;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProjectPlanServices;
import com.projectsupport.services.ProjectProposalServices;


/**
 * Servlet implementation class FindProjectProposal
 */
@WebServlet("/FindProjectProposal")
public class FindProjectProposal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindProjectProposal() {
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
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		int studentId = Integer.parseInt(currentUser.getUserName());
		String errorString = null;
		ProjectProposal proposal = null;
		ProjectPlan plan = null;
		try {
			proposal = ProjectProposalServices.findProjectProposal(conn, studentId);
			plan = ProjectPlanServices.findProjectPlan(conn, studentId);
			request.setAttribute("plan", plan);
			//System.out.println(plan.getStartingDate1());
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		if(proposal == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AddProjectProposal");
			dispatcher.forward(request, response);
		}
		else {
			
			response.sendRedirect(request.getContextPath() + "/EditProjectProposal?success=1");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
