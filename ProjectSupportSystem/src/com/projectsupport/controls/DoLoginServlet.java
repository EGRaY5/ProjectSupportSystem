package com.projectsupport.controls;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import com.projectsupport.models.User;
import com.projectsupport.services.UserServices;
import com.projectsupport.services.MyUtils;



/**
 * Servlet implementation class DoLoginServlet
 */
@WebServlet(urlPatterns = {"/doLogin"})
public class DoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String rememeberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememeberMeStr);
		
		User currentUser = null;
		boolean hasError = false;
		String errorString = null;
		//if the username and password are empty 
		if(userName == null || password == null || password.length() == 0 || userName.length() == 0) { //checking whether login details are correct or not
			hasError = true;
			errorString = "Required UserName and Password";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				//searching the student
				currentUser = UserServices.findUser(conn, userName,password);
				if(currentUser == null){
					hasError = true;
					errorString = "userName or password Invalid";
				}
			} catch(SQLException e){
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		if(hasError){
			currentUser = new User();
			currentUser.setUserName(userName);
			currentUser.setPassword(password);
			
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", currentUser);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login?success=0");
			dispatcher.forward(request, response);
			
		}
		
		else {
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, currentUser);
			
			if(remember){
				MyUtils.storeUserCookie(response, currentUser);
			}
			else {
				MyUtils.deleteUserCookie(response);
			}
			response.sendRedirect(request.getContextPath() + "/userInfo");
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
