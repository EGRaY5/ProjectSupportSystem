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
import com.projectsupport.services.MessageServices;
import com.projectsupport.services.MyUtils;


/**
 * Servlet implementation class DeleteMessages
 */
@WebServlet("/DeleteMessages")
public class DeleteMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessages() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        int messageId = obj.get("msgId").getAsInt();
        String errorString = null;
        System.out.println("Inside DeleteFormSubmission");
        if(errorString == null){
        	try {
				MessageServices.deleteMessages(conn, messageId);
			} catch (SQLException e) {
				errorString = e.getMessage();
				e.printStackTrace();
			}
        	
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
		/*Connection conn = MyUtils.getStoredConnection(request);
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        int messageId = obj.get("msgId").getAsInt();
        String errorString = null;
        System.out.println("Inside DeleteFormSubmission");
        if(errorString == null){
        	try {
				MessageServices.deleteMessages(conn, messageId);
			} catch (SQLException e) {
				errorString = e.getMessage();
				e.printStackTrace();
			}
        	
        }*/
	}

}
