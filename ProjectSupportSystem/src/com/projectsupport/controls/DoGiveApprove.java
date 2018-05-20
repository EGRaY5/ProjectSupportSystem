package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.models.User;
import com.projectsupport.services.ClientServices;
import com.projectsupport.services.InterimReportServices;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;
import com.projectsupport.services.SupervisorServices;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.projectsupport.services.ProjectProposalServices;

/**
 * Servlet implementation class DoGiveApprove
 */
@WebServlet("/DoGiveApprove")
public class DoGiveApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoGiveApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		
		//here we get sID to write 2 querries in service
		String supervisorId = currentUser.getUserName();
		
		
		JsonParser parser = new JsonParser();
	    JsonObject obj = (JsonObject) parser.parse(request.getReader());
	    String approval=obj.get("approval").getAsString();
	    String comment=obj.get("comment").getAsString();
	    String report=obj.get("report").getAsString();
	    
	    
	    
	    
	    System.out.println(approval);
		System.out.println(comment);
		System.out.println(report);
	    
	    try {
	    	if(report.equals("supervisor")){
	    		SupervisorServices.approveSupervisor(conn, supervisorId, approval, comment);
		    	System.out.println("Done in Supervisor approval");
	    	}
	    	else if(report.equals("interim")){
				InterimReportServices.approveInterimReport(conn, supervisorId, approval, comment);
				System.out.println("Done in Interim approval");
			}
	    	else if(report.equals("project")){
	    		ProjectProposalServices.approveProjectProposal(conn, supervisorId, approval, comment);
	    		System.out.println("Done in Project approval");
	    	}
	    	else if(report.equals("client")){
	    		ClientServices.approveClient(conn, supervisorId, approval, comment);
	    		System.out.println("Done in Client approval");
	    	}
	    	else if(report.equals("progress")){
	    		ProgressReportServices.approveProgressReport(conn, supervisorId, approval, comment);
	    		System.out.println("Done in Progress approval");
	    	}
	    	
	    	
	    	
		} catch(SQLException e){
			e.printStackTrace();
		}
	    
	  

	}

	}


