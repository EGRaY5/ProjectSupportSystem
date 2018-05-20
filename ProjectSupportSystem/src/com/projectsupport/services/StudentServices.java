	package com.projectsupport.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.projectsupport.models.Student;



public class StudentServices {
	
		public static List<Student> getStudentList(Connection conn) throws SQLException {
			String sql = "select idStudent,NIC,FullName,Initial,SurName,Email,TelephoneNo from student";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			List<Student> list = new ArrayList<Student>();
			while(rs.next()){
				int studentId = rs.getInt("idStudent");
				String nic = rs.getString("NIC");
				String fullName = rs.getString("FullName");
				String initial = rs.getString("Initial");
				String surName = rs.getString("SurName");
				String email = rs.getString("Email");
				String telephoneNo = rs.getString("TelephoneNo");
				Student student = new Student();
				student.setStudentId(studentId);
				student.setNic(nic);
				student.setFullName(fullName);
				student.setInitial(initial);
				student.setSurName(surName);
				student.setEmail(email);
				student.setTelephoneNo(telephoneNo);
				list.add(student);
				
			}
			return list;
			
		}
		
		public static Student findStudent(Connection conn,int studentId) throws SQLException {
			String sql = "select * from student where idStudent=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, studentId);
			ResultSet rs = pstm.executeQuery();
			while(rs.next()){
				int studId = rs.getInt("idStudent");
				String regNo = rs.getString("RegNo");
				String fullName = rs.getString("FullName");
				String initial = rs.getString("Initial");
				Student student = new Student();
				student.setStudentId(studId);
				student.setFullName(fullName);
				student.setRegNo(regNo);
				student.setInitial(initial);
				return student;
			}
			return null;
		}
		public static void insertStudent(Connection conn,Student student) throws SQLException {
			String sql = "Insert into student (idStudent,RegNo,NIC,FullName,Initial,SurName,Email,TelephoneNo,password) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1,student.getStudentId());
			pstm.setString(2,student.getRegNo());
			pstm.setString(3,student.getNic());
			pstm.setString(4,student.getFullName());
			pstm.setString(5,student.getInitial());
			pstm.setString(6,student.getSurName());
			pstm.setString(7,student.getEmail());
			pstm.setString(8,student.getTelephoneNo());
			pstm.setString(9,student.getPassword());
			pstm.executeUpdate();
		}
		
		public static List<Student> getInterimNotSubmitedList(Connection conn) throws SQLException {
			String sql = "SELECT * FROM student WHERE idStudent NOT IN (SELECT Student_idStudent FROM interimreport)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			List<Student> list = new ArrayList<Student>();
			while(rs.next()){
				int studentId = rs.getInt("idStudent");
				String nic = rs.getString("NIC");
				String fullName = rs.getString("FullName");
				String initial = rs.getString("Initial");
				String surName = rs.getString("SurName");
				String email = rs.getString("Email");
				String telephoneNo = rs.getString("TelephoneNo");
				Student student = new Student();
				student.setStudentId(studentId);
				student.setNic(nic);
				student.setFullName(fullName);
				student.setInitial(initial);
				student.setSurName(surName);
				student.setEmail(email);
				student.setTelephoneNo(telephoneNo);
				list.add(student);
				
			}
			return list;
			
		}
		
		
		
		public static List<Student> getDissertationNotSubmitedList(Connection conn) throws SQLException {
			String sql = "SELECT * FROM student WHERE idStudent NOT IN (SELECT Student_idStudent FROM finaldissertation)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			List<Student> list = new ArrayList<Student>();
			while(rs.next()){
				int studentId = rs.getInt("idStudent");
				String nic = rs.getString("NIC");
				String fullName = rs.getString("FullName");
				String initial = rs.getString("Initial");
				String surName = rs.getString("SurName");
				String email = rs.getString("Email");
				String telephoneNo = rs.getString("TelephoneNo");
				Student student = new Student();
				student.setStudentId(studentId);
				student.setNic(nic);
				student.setFullName(fullName);
				student.setInitial(initial);
				student.setSurName(surName);
				student.setEmail(email);
				student.setTelephoneNo(telephoneNo);
				list.add(student);
				
			}
			return list;
			
		}
		
		public static List<Student> getStudentListofSupervisor(Connection conn,String supervisorId) throws SQLException {
			//String sql1 = "SELECT Student_idStudent FROM supervisor WHERE email = ?";
			//PreparedStatement pstm1 = conn.prepareStatement(sql1);
			
			
			
				//int stuId = rs1.getInt(1);
				String sql = "SELECT * FROM student WHERE supervisorID=?";

				PreparedStatement pstm = conn.prepareStatement(sql);
				pstm.setString(1,supervisorId);
				
				ResultSet rs2 = pstm.executeQuery();

				List<Student> list = new ArrayList<Student>();
				while(rs2.next()){
					int studentId = rs2.getInt("idStudent");
					String nic = rs2.getString("NIC");
					String fullName = rs2.getString("FullName");
					String initial = rs2.getString("Initial");
					String surName = rs2.getString("SurName");
					String email = rs2.getString("Email");
					String telephoneNo = rs2.getString("TelephoneNo");
					Student student = new Student();
					student.setStudentId(studentId);
					student.setNic(nic);
					student.setFullName(fullName);
					student.setInitial(initial);
					student.setSurName(surName);
					student.setEmail(email);
					student.setTelephoneNo(telephoneNo);
					list.add(student);
				
			}
			
			return list;
			
			
			
			
		}

		
		
		
}
		
	

