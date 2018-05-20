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
import com.projectsupport.models.Dissertation;
import com.projectsupport.services.DissertationServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class DoViewDissertationSubmittedList
 */


@WebServlet("/DoViewDissertationSubmittedList")
public class DoViewDissertationSubmittedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoViewDissertationSubmittedList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //retrive array list from database and send and json object list
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String errorString = null;
		Connection conn = MyUtils.getStoredConnection(request);
		List<Dissertation> disList = null;
		try {
			disList = DissertationServices.getDissertationSubmittedList(conn);
			System.out.println("this is shit");
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		String json = new Gson().toJson(disList);
		request.setAttribute("errorString", errorString);
		request.setAttribute("disList",disList);
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
