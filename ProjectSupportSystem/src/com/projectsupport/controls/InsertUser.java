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
import com.projectsupport.models.User;
import com.projectsupport.services.UserServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class InsertUser
 */
@WebServlet("/InsertUser")
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUser() {
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
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		User currentUser = MyUtils.getLoginedUser(session);
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        String uName = obj.get("name").getAsString();
        String uPassword = obj.get("password").getAsString();
        String uPosition = obj.get("position").getAsString();
        
        User newUser = new User();
        newUser.setUserName(uName);
        newUser.setPassword(uPassword);
        newUser.setPosition(uPosition);
        String errorString = null;
        if(errorString == null) {
			try {
				UserServices.insertUser(conn,newUser);
				System.out.println("account Created");
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
	}

}
