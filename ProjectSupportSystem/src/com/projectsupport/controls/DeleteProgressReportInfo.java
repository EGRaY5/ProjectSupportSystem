package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;


/**
 * Servlet implementation class DeleteProgressReportInfo
 */
@WebServlet("/DeleteProgressReportInfo")
public class DeleteProgressReportInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProgressReportInfo() {
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
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        int report = obj.get("reportNo").getAsInt();
        String errorString = null;
        System.out.println("Inside Delete PR report");
        if(errorString == null){
        	try {
				ProgressReportServices.deleteProgressReportSub(conn, report);
			} catch (SQLException e) {
				errorString = e.getMessage();
				e.printStackTrace();
			}
        	
        }
	}

}
