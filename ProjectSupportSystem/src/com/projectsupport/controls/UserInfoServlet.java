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


import com.projectsupport.services.MyUtils;
import com.projectsupport.services.VivaServices;



import com.mysql.jdbc.Connection;
import com.projectsupport.models.User;
import com.projectsupport.models.Viva;;
/**
 * Servlet implementation class UserInfoServlet
 */
@WebServlet(urlPatterns = {"/userInfo"})
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		com.projectsupport.models.User loginedUser =  MyUtils.getLoginedUser(session);
		
		//------------------------------------------------------------------------------
		Connection conn = (Connection) MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		
		
		if(loginedUser == null){
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		else { 
			session.setAttribute("user", loginedUser);
			if(loginedUser.getPosition().equals("student")){
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/bitstudent.jsp");
				dispatcher.forward(request, response);
				
			}
			else if(loginedUser.getPosition().equals("edc")){
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/edccoordinator.jsp");
				dispatcher.forward(request, response);
				
			}
			else if(loginedUser.getPosition().equals("project")){
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ShowDashboard");
				dispatcher.forward(request, response);
			}
			else if(loginedUser.getPosition().equals("supervisor")){
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/supervisor.jsp");
				dispatcher.forward(request, response);
			}
			else if(loginedUser.getPosition().equals("assitant")) {
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/projectcoordinator.jsp");
				dispatcher.forward(request, response);
			}
			else if(loginedUser.getPosition().equals("viva")) {
				//--------------------------------------------------------------------
				
				int id = Integer.parseInt(currentUser.getUserName());
				String errorString = null;
				Viva viva = null;
				
				try{
					viva = VivaServices.findtime(conn, id);
				}
				catch (SQLException e) {
					e.printStackTrace();
					errorString = e.getMessage();
				}
				if(viva == null ){
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/viva.jsp");
					dispatcher.forward(request, response);
				}
				else {
					//request.setAttribute("alertMsg", "You entered data before");
					response.sendRedirect(request.getContextPath()+ "/EditTimeViva");
				}
				
				

			}
			else if(loginedUser.getPosition().equals("admin")){
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/admin/pro_coordinator.jsp");
				dispatcher.forward(request, response);
			}
			
		
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
