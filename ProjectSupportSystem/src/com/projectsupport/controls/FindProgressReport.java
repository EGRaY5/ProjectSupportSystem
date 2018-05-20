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

import com.projectsupport.models.ProgressReport;
import com.projectsupport.models.ProgressReportSub;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;

/**
 * Servlet implementation class FindProgressReport
 */

@WebServlet("/FindProgressReport")
public class FindProgressReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindProgressReport() {
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
		ProgressReport progressreport = null;
		ProgressReportSub progressreportdetails = null;
		try {
			progressreport = ProgressReportServices.findProgressReport(conn, studentId);
			
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		
		try {
			progressreportdetails = ProgressReportServices.findLatestReport(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		if(progressreport == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AddProgressReport");
			dispatcher.forward(request, response);
		}
		else if(progressreport.getReportNo() < progressreportdetails.getReportNo()){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/AddProgressReport");
			dispatcher.forward(request, response);
		}
		else {
			response.sendRedirect(request.getContextPath() + "/EditProgressReport?success=1");
			
		}
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
