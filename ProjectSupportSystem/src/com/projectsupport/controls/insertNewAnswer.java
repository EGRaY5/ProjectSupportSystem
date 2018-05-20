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

import com.projectsupport.models.User;
import com.projectsupport.models.QuestionNAnswer;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.AnswerServices;


/**
 * Servlet implementation class insertNewAnswer
 */
@WebServlet("/insertNewAnswer")
public class insertNewAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertNewAnswer() {
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
		//Get session
		HttpSession session = request.getSession();
		//Get connection
		Connection conn = MyUtils.getStoredConnection(request);
		//Get current user's session
		User currentUser = MyUtils.getLoginedUser(session);
		//If no logged in user ask to login
		if(currentUser == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		
		//Get reply through id reply
		String reply =  request.getParameter("reply");
		
		//Through model set the reply
		QuestionNAnswer newreply = new QuestionNAnswer();
		newreply.setReply(reply);
		
		
		String errorString = null;
		if(errorString == null){
			try {
				//Connect to AnswerServices insertNewAnswer method
				AnswerServices.insertNewAnswer(conn, newreply);
				
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
		request.setAttribute("errorString", errorString);
	    request.setAttribute("reply", newreply);
	    if (errorString != null) {
	    	//If not success load same page
	    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ShowReply?success=0");
	        dispatcher.forward(request, response);
	       }
	    else {
	    		//out.println("<script>  alert('Reply inserted Successfully');  </script>");
	    		//If success load froum through ShowForum Servelet
	           response.sendRedirect(request.getContextPath() + "/ShowForum?success=1");
	           
	    	}
	}

}

