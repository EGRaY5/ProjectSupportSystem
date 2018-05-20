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
import com.projectsupport.services.InterimReportServices;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;

/**
 * Servlet implementation class InsertInterimMark
 */
@WebServlet("/InsertInterimMark")
public class InsertInterimMark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertInterimMark() {
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
		//insert interim marks json to db
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		int studentId = Integer.parseInt((String) session.getAttribute("studentID"));
		JsonParser parser = new JsonParser();
	    JsonObject obj = (JsonObject) parser.parse(request.getReader());
	    float titleM = obj.get("title").getAsFloat();
	    float abstractM = obj.get("abstract").getAsFloat();
	    float introductionM = obj.get("intro").getAsFloat(); 
	    float analysisM = obj.get("analysis").getAsFloat(); 
	    float solutionM = obj.get("solution").getAsFloat(); 
	    float totalM = titleM+abstractM+introductionM+analysisM+solutionM;
	    try {
	    	InterimReportServices.insertMarkInterimMarks(conn, studentId, titleM, abstractM, introductionM, analysisM, solutionM, totalM);
	    	System.out.println("Done in interim marks");
		} catch(SQLException e){
			e.printStackTrace();
		}
	    
	  

	}

}
