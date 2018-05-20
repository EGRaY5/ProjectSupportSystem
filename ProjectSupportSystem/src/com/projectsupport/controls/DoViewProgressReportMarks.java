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

import com.google.gson.Gson;
import com.projectsupport.models.ProgressReport;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;

/**
 * Servlet implementation class DoViewProgressReportMarks
 */
@WebServlet("/DoViewProgressReportMarks")
public class DoViewProgressReportMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewProgressReportMarks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int studentId = (int) session.getAttribute("studentId"); //get student id from the session
		int reportNo =  (int) session.getAttribute("reportNo"); 
		Connection conn = MyUtils.getStoredConnection(request);
		String errorString = null;
		float mark = 0;
		try {
			mark = ProgressReportServices.getProgressReportMarks(conn, studentId, reportNo);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(mark);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
