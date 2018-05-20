package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.projectsupport.models.VivaMember;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.VivaMemberServices;

/**
 * Servlet implementation class InsertVivaMember
 */
@WebServlet("/InsertVivaMember")
public class InsertVivaMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertVivaMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("servlet InsertVivaMem");
		Connection conn = MyUtils.getStoredConnection(request);
		HttpSession session = request.getSession();
       	JsonParser parser = new JsonParser();
        JsonObject obj = (JsonObject) parser.parse(request.getReader());
        String vId = obj.get("id").getAsString();
        String vFname = obj.get("fname").getAsString();
        String vLname = obj.get("lname").getAsString();
        String vEmail = obj.get("email").getAsString();
        String vDepartment = obj.get("department").getAsString();
        String vPosition = obj.get("role").getAsString();
        
        VivaMember newViva = new VivaMember();
        newViva.setId(vId);
        newViva.setFname(vFname);
        newViva.setLname(vLname);
        newViva.setEmail(vEmail);
        newViva.setDepartment(vDepartment);
        newViva.setPosition(vPosition);
        String errorString = null;
        if(errorString == null) {
			try {
				VivaMemberServices.insertVivaMember(conn,newViva);
				System.out.println("viva");
			} catch(SQLException e){
				e.printStackTrace();
				errorString = e.getMessage();
				
			}
			
		}
	}

}
