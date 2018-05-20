package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.projectsupport.models.Notification;

public class NotificationServices {
	
	//Getting notification 
	
	public static Notification getNotification(Connection conn,String supervisorId) throws SQLException {
		String sql = "select * from submission where supervisorID= ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,supervisorId);
		ResultSet rs = pstm.executeQuery();
		System.out.println("services called");
		while(rs.next()){
			System.out.println("services called 22222");
			int studentID = rs.getInt("Student_idStudent");
			String supervisorID = rs.getString("supervisorID");
			String report = rs.getString("report");
			String approval = rs.getString("approval");
			String name=rs.getString("name");
			
			Notification notification = new Notification();
			notification.setStudentID(studentID);
			notification.setName(name);
			notification.setSupervisorID(supervisorID);
			notification.setReport(report);
			notification.setApproval(approval);
			
			System.out.println(notification.getSupervisorID());
			
			return notification;
			
		}
		return null;
	}
	

}
