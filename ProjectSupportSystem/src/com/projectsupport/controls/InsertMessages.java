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
import com.projectsupport.models.Message;
import com.projectsupport.models.User;
import com.projectsupport.services.MessageServices;
import com.projectsupport.services.MyUtils;


/**
 * Servlet implementation class InsertMessages
 */
@WebServlet("/InsertMessages")
public class InsertMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMessages() {
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
		User currentUser = MyUtils.getLoginedUser(session);
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        String header = obj.get("header").getAsString();
        String msgDetail = obj.get("detail").getAsString();
        
        Message msg = new Message();
        msg.setHeader(header);
        msg.setDetail(msgDetail);
        msg.setUserName(currentUser.getUserName());
        String errorString = null;
        if(errorString == null) {
			try {
				MessageServices.insertMessage(conn,msg);
				System.out.println("message Done");
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
        
	}

}
