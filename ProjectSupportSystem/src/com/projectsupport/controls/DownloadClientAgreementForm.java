package com.projectsupport.controls;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projectsupport.models.Client;
import com.projectsupport.models.User;
import com.projectsupport.services.ClientServices;
import com.projectsupport.services.MyUtils;


/**
 * Servlet implementation class DownloadClientAgreementForm
 */
@WebServlet("/DownloadClientAgreementForm")
public class DownloadClientAgreementForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadClientAgreementForm() {
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
		//System.out.println(session.getAttribute("studentID"));
		int studentId = 0;
		try{
			studentId = Integer.parseInt(currentUser.getUserName());
		}catch(Exception e){
			studentId = Integer.parseInt((String) session.getAttribute("studentID"));
		}
		String errorString = null;
		Client client = null;
		try {
			client = ClientServices.findClient(conn, studentId);
		} catch (SQLException e){
			e.printStackTrace();
			errorString = e.getMessage();
		}
		ServletOutputStream  out = response.getOutputStream();
		String fileName = client.getFormName();
		String path = "/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent/";
		//response.setContentType("APPLICATION/pdf");
		//response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		FileInputStream fileinputstream = new FileInputStream(path+fileName);
		byte[] buffer = new byte[1024];
		int i=0;
		while(true){
			i = fileinputstream.read(buffer);
			if(i < 0){
				break;
			}
			out.write(buffer,0,i);
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
