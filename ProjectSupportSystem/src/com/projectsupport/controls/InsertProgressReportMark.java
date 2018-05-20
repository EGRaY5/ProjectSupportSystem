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

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;

/**
 * Servlet implementation class InsertProgressReportMark
 */
@WebServlet("/InsertProgressReportMark")
public class InsertProgressReportMark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProgressReportMark() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		int studentId = (int) session.getAttribute("studentId");
		int reportNo =  (int) session.getAttribute("reportNo");
		//System.out.println("sdsdsdsdsadsd"+studentId);
		JsonParser parser = new JsonParser();
	    JsonObject obj = (JsonObject) parser.parse(request.getReader());
	    float mark = obj.get("mark").getAsFloat();
	    String errorString = null;
	    if(errorString == null) {
			try {
				ProgressReportServices.insertMarks(conn, studentId, reportNo, mark);
				System.out.println("done");
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
					
			} 
				
		}
		
	}
	
}
