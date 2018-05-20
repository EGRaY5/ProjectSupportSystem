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
import com.projectsupport.models.Client;
import com.projectsupport.models.User;
import com.projectsupport.services.ClientServices;
import com.projectsupport.services.MyUtils;

/**
 * Servlet implementation class DoAddClient
 */
@WebServlet("/DoAddClient")
@MultipartConfig(maxFileSize = 16177215)
public class DoAddClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = Logger.getLogger(DoAddClient.class.getCanonicalName());    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddClient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //Get data from  form and insert into database 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Connection conn = MyUtils.getStoredConnection(request);
		User currentUser = MyUtils.getLoginedUser(session);
		if(currentUser == null){
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/login");
	        dispatcher.forward(request, response);
	        return;
		}
		int studentId = Integer.parseInt(currentUser.getUserName());
		String name = request.getParameter("name");
		String registrationNo = request.getParameter("registrationNo");
		String addressLine1 = request.getParameter("addressLine1");
		String addressLine2 = request.getParameter("addressLine2");
		String addressLine3 = request.getParameter("addressLine3");
		String email = request.getParameter("email");
		String telephoneNo = request.getParameter("telephoneNo");
		InputStream inputstream = null;
		OutputStream outputstream = null;
		PrintWriter writer = response.getWriter();
		Part filepart = request.getPart("formName");
		String fileName =  currentUser.getUserName()+"_clientAgreement.pdf";;
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
			Client newclient = new Client();
			newclient.setOrganizationName(name);
			newclient.setRegistrationNo(registrationNo);
			newclient.setAddressLine1(addressLine1);
			newclient.setAddressLine2(addressLine2);
			newclient.setAddressLine3(addressLine3);
			newclient.setOrganizationEmail(email);
			newclient.setTelephoneNo(telephoneNo);
			newclient.setFormName(fileName);
			newclient.setStudentId(studentId);
			String errorString = null;
			if(errorString == null){
				try {
					ClientServices.insertClient(conn, newclient);
					
				} catch(SQLException e){
					e.printStackTrace();
					errorString = e.getMessage();
				}
				
			}
			
			 request.setAttribute("errorString", errorString);
			 request.setAttribute("newClient", newclient);
		    
		    if (errorString != null) {
		    	//request.setAttribute("", o);
		    	RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/AddClient?success=0");
		        dispatcher.forward(request, response);
		       }
		    else {//out.println("<script>  alert('Student inserted Sucessfully');  </script>");
		           response.sendRedirect(request.getContextPath() + "/EditClient?success=1");
		           
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


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
