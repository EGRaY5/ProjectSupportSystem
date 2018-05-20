package com.projectsupport.controls;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.models.Supervisor;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.SupervisorServices;

/**
 * Servlet implementation class DownloadSupervisorFrom
 */
@WebServlet("/DownloadSupervisorFrom")
public class DownloadSupervisorFrom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadSupervisorFrom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		int studentId = 0;
		try{
			studentId = Integer.parseInt(currentUser.getUserName());
		}catch(Exception e){
			studentId = Integer.parseInt((String) session.getAttribute("studentID"));
		}
		String errorString = null;
		Supervisor supervisor = null;
		try {
			supervisor = SupervisorServices.findSupervisor(conn, studentId);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		PrintWriter out = response.getWriter();
		String fileName = supervisor.getAgreementForm();
		String path = "/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent/";
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		FileInputStream fileinputstream = new FileInputStream(path+fileName);
		int i;
		while((i=fileinputstream.read()) != -1){
			out.write(i);
		}
		out.close();
		fileinputstream.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
