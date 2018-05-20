package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.projectsupport.models.QuestionNAnswer;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.AnswerServices;

/**
 * Servlet implementation class DoViewAnswerList
 */
@WebServlet("/DoViewAnswerList")
public class DoViewAnswerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewAnswerList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//question array list and send it as a json list
		String errorString = null;
		Connection conn = MyUtils.getStoredConnection(request);
		List<QuestionNAnswer> answerList = null;
		try {
			//Go to AnswerServices and get data in the method getAnswerList and store to answerList
			answerList = AnswerServices.getAnswerList(conn);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		//Create a json list list from data in answerList
		String json = new Gson().toJson(answerList);
		request.setAttribute("errorString", errorString);
		request.setAttribute("answerList",answerList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
