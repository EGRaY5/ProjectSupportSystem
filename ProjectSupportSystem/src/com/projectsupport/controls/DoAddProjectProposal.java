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
 * Servlet implementation class DoAddProjectProposal
 */
@WebServlet("/DoAddProjectProposal")
public class DoAddProjectProposal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddProjectProposal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//Get form data from database and insert
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		int studentId = Integer.parseInt(currentUser.getUserName());
		String projectTitle =  request.getParameter("projectTitle");
		int noOfAttempts =  Integer.parseInt(request.getParameter("noOfAttempts"));
		String previousDecision = request.getParameter("previousDecision");
		String earlierTitle = request.getParameter("earlierTitle");
		String motivation = request.getParameter("motivation");
		String objectives = request.getParameter("objectives");
		String scope = request.getParameter("scope");
		String funtionalities =  request.getParameter("funtionalities");
		String deliverables = request.getParameter("deliverables");
		String resources = request.getParameter("resources");
		String evaluation = request.getParameter("evauation");
		
		ProjectProposal proposal = new ProjectProposal();
		proposal.setProjectTitle(projectTitle);
		proposal.setNoOfAttempts(noOfAttempts);
		proposal.setPreviousDecision(previousDecision);
		proposal.setEarlierProjectTitle(earlierTitle);
		proposal.setMotivation(motivation);
		proposal.setObjectives(objectives);
		proposal.setScope(scope);
		proposal.setFunctionalities(funtionalities);
		proposal.setDeliverables(deliverables);
		proposal.setResources(resources);
		proposal.setEvaluation(evaluation);
		proposal.setStudentId(studentId);
		
		String startingDate1 = request.getParameter("sdate1");
		String endingDate1 = request.getParameter("edate1");
		String startingDate2 = request.getParameter("sdate2");
		String endingDate2 = request.getParameter("edate2");
		String startingDate3 = request.getParameter("sdate3");
		String endingDate3 = request.getParameter("edate3");
		String startingDate4 = request.getParameter("sdate4");
		String endingDate4 = request.getParameter("edate4");
		String startingDate5 = request.getParameter("sdate5");
		String endingDate5 = request.getParameter("edate5");
		String startingDate6 = request.getParameter("sdate6");
		String endingDate6 = request.getParameter("edate6");
		String startingDate7 = request.getParameter("sdate7");
		String endingDate7 = request.getParameter("edate7");
		String startingDate8 = request.getParameter("sdate8");
		String endingDate8 = request.getParameter("edate8");
		String startingDate9 = request.getParameter("sdate9");
		String endingDate9 = request.getParameter("edate9");
		String startingDate10 = request.getParameter("sdate10");
		String endingDate10 = request.getParameter("edate10");
		
		ProjectPlan plan = new ProjectPlan();
		plan.setStartingDate1(startingDate1);
		plan.setEndingDate1(endingDate1);
		plan.setStartingDate2(startingDate2);
		plan.setEndingDate2(endingDate2);
		plan.setStartingDate3(startingDate3);
		plan.setEndingDate3(endingDate3);
		plan.setStartingDate4(startingDate4);
		plan.setEndingDate4(endingDate4);
		plan.setStartingDate5(startingDate5);
		plan.setEndingDate5(endingDate5);
		plan.setStartingDate6(startingDate6);
		plan.setEndingDate6(endingDate6);
		plan.setStartingDate7(startingDate7);
		plan.setEndingDate7(endingDate7);
		plan.setStartingDate8(startingDate8);
		plan.setEndingDate8(endingDate8);
		plan.setStartingDate9(startingDate9);
		plan.setEndingDate9(endingDate9);
		plan.setStartingDate10(startingDate10);
		plan.setEndingDate10(endingDate10);
		plan.setStudentId(studentId);
		String errorString = null;
		if(errorString == null){
			try {
				ProjectProposalServices.insertProjectProposal(conn, proposal);
				ProjectPlanServices.insertProjectPlan(conn, plan);
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
		request.setAttribute("errorString", errorString);
	    request.setAttribute("proposal", proposal);
	    if (errorString != null) {
	    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddProjectProposal?success=0");
	        dispatcher.forward(request, response);
	       }
	    else {
	    		//out.println("<script>  alert('Student inserted Sucessfully');  </script>");
	           response.sendRedirect(request.getContextPath() + "/EditProjectProposal?success=1");
	           
	    	}
	}

}
