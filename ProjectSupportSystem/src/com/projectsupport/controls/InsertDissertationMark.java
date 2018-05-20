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
import com.projectsupport.services.DissertationServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class InsertDissertationMark
 */
@WebServlet("/InsertDissertationMark")
public class InsertDissertationMark extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDissertationMark() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//inserting marks for interim report
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		int studentId = Integer.parseInt((String) session.getAttribute("studentID"));
		System.out.println(studentId);
		JsonParser parser = new JsonParser();
	    JsonObject obj = (JsonObject) parser.parse(request.getReader());
	    float introduction = obj.get("introduction").getAsFloat();
	    float analysis  = obj.get("analysis").getAsFloat();
	    float design = obj.get("design").getAsFloat(); 
	    float implementation = obj.get("implementation").getAsFloat(); 
	    float evalution = obj.get("evaluation").getAsFloat(); 
	    float conclusion = obj.get("conclution").getAsFloat(); 
	    float reference = obj.get("reference").getAsFloat(); 
	    float appendices = obj.get("appendices").getAsFloat(); 
	    float general = obj.get("general").getAsFloat(); 
	    float  total = introduction+analysis+design+implementation+evalution+conclusion+reference+appendices+general;	    
	    
	    try {
	    	DissertationServices.insertDissertationMarks(conn, studentId, introduction, analysis, design, implementation, evalution, conclusion, reference, appendices, general, total);
	    	System.out.println("Insert Dissertation");
	    	
		} catch(SQLException e){
			e.printStackTrace();
		}
	}

}
