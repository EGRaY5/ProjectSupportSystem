package com.projectsupport.controls;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.projectsupport.models.Supervisor;
import com.projectsupport.models.User;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.SupervisorServices;
import com.projectsupport.services.UserServices;

/**
 * Servlet implementation class DoAddSupervisor
 */
@WebServlet("/DoAddSupervisor")
@MultipartConfig(maxFileSize = 16177215)
public class DoAddSupervisor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(DoAddSupervisor.class.getCanonicalName());  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddSupervisor() {
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
		if(currentUser == null){
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
	        dispatcher.forward(request, response);
		}
		int studentId = Integer.parseInt(currentUser.getUserName());
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobileNo = request.getParameter("mobileNo");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String city = request.getParameter("city");
		String password = "ucsc@123";
		InputStream inputstream = null;
		OutputStream outputstream = null;
		PrintWriter writer = response.getWriter();
		Part filepart = request.getPart("agreementForm");
		String fileName = currentUser.getUserName()+"_supervisorAgreement.pdf";;
		String path = "/home/lakshan/git/projectSupportSystem/ProjectSupportSystem/WebContent";
		String partHeader = filepart.getHeader("content-disposition");
		LOGGER.log(Level.INFO,"Part Header = {0}",partHeader);
		/*for(String content : filepart.getHeader("content-disposition").split(";")){
			if(content.trim().startsWith("filename")){
				fileName = content.substring(content.indexOf('=')+1).trim().replace("\"","");
			}
		}*/
		
		try {
			outputstream = new FileOutputStream(new File(path+File.separator+fileName));
			inputstream = filepart.getInputStream();
			int read = 0;
			final byte[] bytes = new byte[1024];
			while ((read = inputstream.read(bytes))!= -1){
				outputstream.write(bytes,0,read);
			}
			
			System.out.println("New file "+fileName+ " created at "+path);
			LOGGER.log(Level.INFO,"File{0}being uploaded to {1}",new Object[]{fileName,path});
			Supervisor newsupervisor = new Supervisor();
			newsupervisor.setFirstName(firstName);
			newsupervisor.setLastName(lastName);
			newsupervisor.setEmail(email);
			newsupervisor.setMobileNo(mobileNo);
			newsupervisor.setAddressLine1(addressLine1);
			newsupervisor.setAddressLine2(addressLine2);
			newsupervisor.setCity(city);
			newsupervisor.setAgreementForm(fileName);
			newsupervisor.setStudentId(studentId);
			
			String errorString = null;
			if(errorString == null){
				try {
					SupervisorServices.insertSupervisor(conn, newsupervisor);
					UserServices.InsertUser(conn,email, password, "supervisor");
					
				} catch(SQLException e){
					e.printStackTrace();
					errorString = e.getMessage();
				}
				
			}
			
			 request.setAttribute("errorString", errorString);
			 request.setAttribute("newSupervisor", newsupervisor);
		    
		    if (errorString != null) {
		    	//request.setAttribute("", o);
		    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddSupervisor?success=0");
		        dispatcher.forward(request, response);
		       }
		    else {//out.println("<script>  alert('Student inserted Sucessfully');  </script>");
		           response.sendRedirect(request.getContextPath() + "/EditSupervisorView?success=1");
		           
		    	}
			
			
			
		
		} catch(FileNotFoundException e){
			System.out.println("You either did not specify a file to upload or are trying to upload a file to a protected or nonexistent location.");
			System.out.println("<br/> ERROr:"+ e.getMessage());
			LOGGER.log(Level.SEVERE,"Problem during file upload. Error: {0}", new Object[]{e.getMessage()});
		} finally {
			if(outputstream != null){
				outputstream.close();
			}
			if(inputstream != null){
				inputstream.close();
			}
			if(writer != null){
				writer.close();
			}
		}
	}
		
		
		/*if(filepart != null){
			System.out.println(filepart.getName());
			System.out.println(filepart.getSize());
			System.out.println(filepart.getContentType());
			
			inputstream = filepart.getInputStream();
			
		} */
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
