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

import com.projectsupport.models.ProgressReport;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;




/**
 * Servlet implementation class ShowProgressReportList
 */
@WebServlet("/ShowProgressReportList")
public class ShowProgressReportList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowProgressReportList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int  studentId = Integer.parseInt(request.getParameter("stuID"));
		int reportNo = Integer.parseInt(request.getParameter("repNO"));
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
		session.setAttribute("studentId", studentId);
		session.setAttribute("reportNo", reportNo);
		ProgressReport progressreport = null;
		try {
			progressreport = ProgressReportServices.getReportByIdandNo(conn, studentId, reportNo);
			//System.out.println(student.getFullName());
		} catch (SQLException e) {

			e.printStackTrace();
		}
		session.setAttribute("progressreport", progressreport);
		RequestDispatcher dispather = this.getServletContext()
				.getRequestDispatcher("/projectcoordinator/progressReportMarkingView.jsp");
		dispather.forward(request, response);
		System.out.println("add client servlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
