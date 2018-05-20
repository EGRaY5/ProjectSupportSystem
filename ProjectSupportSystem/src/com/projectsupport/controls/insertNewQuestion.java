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
 * Servlet implementation class insertNewQuestion
 */
@WebServlet("/insertNewQuestion")
public class insertNewQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertNewQuestion() {
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
		//Get current logged in user'session
		User currentUser = MyUtils.getLoginedUser(session);
		//if no user logged in tell to login
		if(currentUser == null){
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/login");
			dispatcher.forward(request, response);
			return;
		}
		//Get current user's username and store to userName
		String userName = (currentUser.getUserName());
		//Get question inputed through the id question and store to variable question
		String question =  request.getParameter("question");
		
		//Set question and username through the model QuestionNAnswer 
		QuestionNAnswer newquestion = new QuestionNAnswer();
		newquestion.setQuest(question);
		newquestion.setUserName(userName);
		
		String errorString = null;
		if(errorString == null){
			try {
				//Connect to insertNewQuestion in AnswerServices
				AnswerServices.insertNewQuestion(conn, newquestion);
				
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
		request.setAttribute("errorString", errorString);
	    request.setAttribute("question", newquestion);
	    if (errorString != null) {
	    	//If not success in posting question load same page
	    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/ShowAskQuestion?success=0");
	        dispatcher.forward(request, response);
	       }
	    else {
	    		//out.println("<script>  alert('Question inserted Successfully');  </script>");
	    		// If success in posting question load the forum page through ShowForum servelet
	           response.sendRedirect(request.getContextPath() + "/ShowForum?success=1");
	           
	    	}
	}

}

