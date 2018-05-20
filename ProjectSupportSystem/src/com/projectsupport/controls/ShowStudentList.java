package com.projectsupport.controls;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class ShowStudentList
 */
@WebServlet("/ShowStudentList")
public class ShowStudentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowStudentList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		com.projectsupport.models.User loginedUser =  MyUtils.getLoginedUser(session);
		String position = loginedUser.getPosition();
		if(position.equals("project")){
			RequestDispatcher dispather = this.getServletContext().getRequestDispatcher("/projectcoordinator/studentlistview.jsp");
			dispather.forward(request, response);
			System.out.println("show student list");
			//System.out.println(loginedUser.getUserName());
			
		}else{
			RequestDispatcher dispather = this.getServletContext().getRequestDispatcher("/supervisor/studentlistview.jsp");
			dispather.forward(request, response);
			System.out.println("show student list of supervisor");
			
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
