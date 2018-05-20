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
import com.projectsupport.models.Student;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.StudentServices;

/**
 * Servlet implementation class DoViewDissertationNotSubmittedList
 */
@WebServlet("/DoViewDissertationNotSubmittedList")
public class DoViewDissertationNotSubmittedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewDissertationNotSubmittedList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //retrieve student array list and sending as Json object list
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorString = null;
		Connection conn = MyUtils.getStoredConnection(request);
		List<Student> studentList = null;
		try {
			studentList = StudentServices.getInterimNotSubmitedList(conn);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(studentList);
		request.setAttribute("errorString", errorString);
		//request.setAttribute("studentList",studentList);
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
