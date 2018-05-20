package com.projectsupport.controls;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.projectsupport.models.ProgressReportSub;
import com.projectsupport.services.MyUtils;
import com.projectsupport.services.ProgressReportServices;


/**
 * Servlet implementation class InsertProgressReportInfo
 */
@WebServlet("/InsertProgressReportInfo")
public class InsertProgressReportInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProgressReportInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Connection conn = MyUtils.getStoredConnection(request);
	       // Gson gson = new Gson();
	        JsonParser parser = new JsonParser();
	        JsonObject obj = (JsonObject) parser.parse(request.getReader());
	        String jDate = obj.get("enddate").getAsString();
	        String jTime = obj.get("endtime").getAsString();
	        int reportNo = obj.get("no").getAsInt();
	        String realDate = jDate.substring(0,10);
	        String hour=null;
	        String minut=null;
	        int hours  = Integer.parseInt(jTime.substring(11,13));
	        hours = (hours+6)%24;
	        hour = Integer.toString(hours);
	        if(hour.length()==1){
	        	 hour = "0"+hour;
	        }
	       
	        int minutes = Integer.parseInt(jTime.substring(14,16));
	        minutes = (minutes+30)%60;
	        minut = Integer.toString(minutes);
	        if(minut.length()==1){
	        	 minut = "0"+minut;
	        }
	        
	        String realTime = hour+":"+minut;
	        ProgressReportSub reportDetails = new ProgressReportSub();
	        reportDetails.setReportNo(reportNo);
	        reportDetails.setEndDate(realDate);
	        reportDetails.setEndTime(realTime);
	        
	        String errorString = null;
	        if(errorString == null) {
				try {
					ProgressReportServices.insertProgressReportSub(conn, reportDetails);
					System.out.println("done");
				} catch(SQLException e){
					e.printStackTrace();
					errorString = e.getMessage();
					
				} 
				
			}
	        
	}

}
