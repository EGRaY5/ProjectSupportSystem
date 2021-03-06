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
import com.projectsupport.models.Question;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.QuestionServices;

/**
 * Servlet implementation class DoViewQuestionList
 */
@WebServlet("/DoViewQuestionList")
public class DoViewQuestionList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewQuestionList() {
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
		List<Question> questionList = null;
		try {
			questionList = QuestionServices.getQuestionList(conn);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(questionList);
		request.setAttribute("errorString", errorString);
		request.setAttribute("questionList",questionList);
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
