package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.projectsupport.models.Supervisor;

public class SupervisorServices {
	public static void insertSupervisor(Connection conn, Supervisor supervisor) throws SQLException {
		String sql = "Insert into supervisor (FirstName,LastName,email,mobileNo,AddressLine1,AddressLine2,City,FormPath,Student_idStudent) values (?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,supervisor.getFirstName());
		pstm.setString(2, supervisor.getLastName());
		pstm.setString(3,supervisor.getEmail());
		pstm.setString(4, supervisor.getMobileNo());
		pstm.setString(5, supervisor.getAddressLine1());
		pstm.setString(6, supervisor.getAddressLine2());
		pstm.setString(7, supervisor.getCity());
		pstm.setString(8,supervisor.getAgreementForm());
		pstm.setInt(9, supervisor.getStudentId());
		pstm.executeUpdate();
		
		String sql2 = "Update student set supervisorID=? where idStudent=?";
		PreparedStatement pstm2 = conn.prepareStatement(sql2);
		pstm2.setString(1,supervisor.getEmail());
		pstm2.setInt(2,supervisor.getStudentId());
		pstm2.executeUpdate();
		
		
		
		
		
	}
	
	public static Supervisor findSupervisor(Connection conn,int userId) throws SQLException {
		String sql = "Select FirstName,LastName,email,mobileNo,AddressLine1,AddressLine2,City,FormPath from supervisor where Student_idStudent= ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");
			String email = rs.getString("email");
			String mobileNo = rs.getString("mobileNo");
			String AddressLine1 = rs.getString("AddressLine1");
			String AddressLine2 = rs.getString("AddressLine2");
			String city = rs.getString("City");
			String formPath = rs.getString("FormPath");
			Supervisor supervisor = new Supervisor();
			supervisor.setFirstName(firstName);
			supervisor.setLastName(lastName);
			supervisor.setEmail(email);
			supervisor.setMobileNo(mobileNo);
			supervisor.setAddressLine1(AddressLine1);
			supervisor.setAddressLine2(AddressLine2);
			supervisor.setCity(city);
			supervisor.setAgreementForm(formPath);
			return supervisor;
			
		}
		return null;
	}
	
	
	public static void editSupervisor(Connection conn,Supervisor supervisor) throws SQLException{
		String sql = "update supervisor set FirstName=?,LastName=?,email=?,mobileNo=?,AddressLine1=?,AddressLine2=?,City=?,FormPath=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, supervisor.getFirstName());
		pstm.setString(2, supervisor.getLastName());
		pstm.setString(3, supervisor.getEmail());
		pstm.setString(4, supervisor.getMobileNo());
		pstm.setString(5, supervisor.getAddressLine1());
		pstm.setString(6, supervisor.getAddressLine2());
		pstm.setString(7, supervisor.getCity());
		pstm.setString(8, supervisor.getAgreementForm());
		pstm.setInt(9,supervisor.getStudentId());
		pstm.executeUpdate();
		
	}
	
	public static void deleteSupervisor(Connection conn,int userId) throws SQLException {
		String sql = "Delete from supervisor where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, userId);
		pstm.executeUpdate();
	}
	
	public static void approveSupervisor(Connection conn,String supervisorId,String approval ,String comment) throws SQLException {
		//String sql = "Delete from InterimReport where Student_idStudent=?";
		//supervisor has one student(assumption)
		String sql="UPDATE supervisor SET supervisorApproval=?,supervisorComment=? WHERE email=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,approval);
		pstm.setString(2,comment);
		pstm.setString(3, supervisorId);
		
		pstm.executeUpdate();
		
		
	}
	
	
	public static Supervisor viewSupervisor(Connection conn,String userId) throws SQLException {
		String sql = "SELECT FirstName,LastName,email,mobileNo,AddressLine1,AddressLine2,City,FormPath FROM supervisor WHERE email= ?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");
			String email = rs.getString("email");
			String mobileNo = rs.getString("mobileNo");
			String AddressLine1 = rs.getString("AddressLine1");
			String AddressLine2 = rs.getString("AddressLine2");
			String city = rs.getString("City");
			String formPath = rs.getString("FormPath");
			Supervisor supervisor = new Supervisor();
			supervisor.setFirstName(firstName);
			supervisor.setLastName(lastName);
			supervisor.setEmail(email);
			supervisor.setMobileNo(mobileNo);
			supervisor.setAddressLine1(AddressLine1);
			supervisor.setAddressLine2(AddressLine2);
			supervisor.setCity(city);
			supervisor.setAgreementForm(formPath);
			return supervisor;

			
		}
		System.out.println("supervisor services finished");
		return null;
		
	}

	

}
