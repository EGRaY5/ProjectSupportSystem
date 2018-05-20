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
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.projectsupport.models.Student;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.StudentServices;


@WebServlet("/DoViewStudentsofSupervisor")
public class DoViewStudentsofSupervisor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DoViewStudentsofSupervisor() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User currentUser = MyUtils.getLoginedUser(session);
		String supervisorId = currentUser.getUserName();
		System.out.println("supervisor id is"+ supervisorId);
		
		
		String errorString = null;
		Connection conn = MyUtils.getStoredConnection(request);
		List<Student> studentList = null;
		try {
			studentList = StudentServices.getStudentListofSupervisor(conn,supervisorId);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(studentList);
		request.setAttribute("errorString", errorString);
		request.setAttribute("studentList",studentList);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
