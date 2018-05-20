package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.projectsupport.models.Client;

// Services of Client insert update delete Queries

public class ClientServices {
	public static void insertClient(Connection conn, Client client) throws SQLException {
		String sql = "Insert into client (name,registrationNo,addressLine1,addressLine2,addressLine3,email,telephoneNo,formName,Student_idStudent) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,client.getOrganizationName());
		pstm.setString(2, client.getRegistrationNo());
		pstm.setString(3,client.getAddressLine1());
		pstm.setString(4,client.getAddressLine2());
		pstm.setString(5,client.getAddressLine3());
		pstm.setString(6, client.getOrganizationEmail());
		pstm.setString(7, client.getTelephoneNo());
		pstm.setString(8,client.getFormName());
		pstm.setInt(9,client.getStudentId());
		pstm.executeUpdate();
		
		
	}
	
	public static Client findClient(Connection conn,int userId) throws SQLException {
		String sql = "Select name,registrationNo,addressLine1,addressLine2,addressLine3,email,telephoneNo,formName from client where Student_idStudent= ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String name = rs.getString("name");
			String registrationNo = rs.getString("registrationNo");
			String addressLine1 = rs.getString("addressLine1");
			String addressLine2 = rs.getString("addressLine2");
			String addressLine3 = rs.getString("addressLine3");
			String email = rs.getString("email");
			String telephoneNo = rs.getString("telephoneNo");
			String formName = rs.getString("formName");
			Client client = new Client();
			client.setOrganizationName(name);;
			client.setRegistrationNo(registrationNo);
			client.setAddressLine1(addressLine1);
			client.setAddressLine2(addressLine2);
			client.setAddressLine3(addressLine3);
			client.setOrganizationEmail(email);
			client.setTelephoneNo(telephoneNo);
			client.setFormName(formName);
			return client;
			
		}
		return null;
	}
	
	public static void editClient(Connection conn,Client client) throws SQLException {
		String sql = "update client set name=?,registrationNo=?,addressLine1=?,addressLine2=?,addressLine3=?,email=?,telephoneNo=?,formName=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, client.getOrganizationName());
		pstm.setString(2, client.getRegistrationNo());
		pstm.setString(3, client.getAddressLine1());
		pstm.setString(4, client.getAddressLine2());
		pstm.setString(5, client.getAddressLine3());
		pstm.setString(6, client.getOrganizationEmail());
		pstm.setString(7, client.getTelephoneNo());
		pstm.setString(8, client.getFormName());
		pstm.setInt(9, client.getStudentId());
		pstm.executeUpdate();
	}
	
	public static void deleteClient(Connection conn, int userId) throws SQLException {
		String sql = "Delete from client where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, userId);
		pstm.executeUpdate();
	}
	
	public static void approveClient(Connection conn,String supervisorId,String approval ,String comment) throws SQLException {
		//String sql = "Delete from InterimReport where Student_idStudent=?";
		//supervisor has one student(assumption)
		String sql1 = "SELECT Student_idStudent FROM supervisor WHERE email = ?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setString(1,supervisorId);
		System.out.println("SQL eke bagyk hri");
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int stuId = rs1.getInt(1);

			String sql2 = "UPDATE client SET supervisorApproval=?,supervisorComment=? WHERE Student_idStudent=?";
				PreparedStatement pstm2 = conn.prepareStatement(sql2);
				pstm2.setString(1,approval);
				pstm2.setString(2,comment);
				pstm2.setInt(3, stuId);
				
				pstm2.executeUpdate();



		}

	}

}
