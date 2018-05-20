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
import com.projectsupport.models.ProgressReportSub;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;


/**
 * Servlet implementation class DoViewPReportDetailsList
 */
@WebServlet("/DoViewPReportDetailsList")
public class DoViewPReportDetailsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewPReportDetailsList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//retrieve progress report submission details
		String errorString = null;
		Connection conn = MyUtils.getStoredConnection(request);
		System.out.println("al least servlet working");
		List<ProgressReportSub> pReportList = null;
		try {
			pReportList = ProgressReportServices.findReportDetails(conn);
			System.out.println("inside try");
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(pReportList);
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
		
	}

}
