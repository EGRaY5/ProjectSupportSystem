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

import com.projectsupport.models.Student;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.UserServices;

/**
 * Servlet implementation class EditUsers
 */
@WebServlet("/EditUsers")
public class EditUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorString = null;
		String userName = request.getParameter("uName");
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		session.setAttribute("userName",userName );
		User newUser=null;
		try {
			newUser = UserServices.findUser(conn,userName);
			session.setAttribute("newUser",newUser);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("newUser", newUser);
		RequestDispatcher dispather = this.getServletContext()
				.getRequestDispatcher("/admin/edit_user.jsp");
		dispather.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
