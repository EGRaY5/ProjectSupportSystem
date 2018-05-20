package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.projectsupport.models.InterimReport;


public class InterimReportServices {
	public static void insertInterimReport(Connection conn,InterimReport interim) throws SQLException{
		String sql = "Insert into interimreport (formName,Student_idStudent) values (?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,interim.getFormName());
		pstm.setInt(2,interim.getStudentId());
		pstm.executeUpdate();
	}
	
	
	
	public static InterimReport findInterimReport(Connection conn,int studentId) throws SQLException {
		String sql = "select * from interimreport where Student_idStudent=? ";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String formName = rs.getString("formName");
			float totalMarks = rs.getFloat("totalmarks");
			float title = rs.getFloat("titleM");
			float abstractM = rs.getFloat("abstractM");
			float intro = rs.getFloat("introductionM");
			float analysis = rs.getFloat("analysisM");
			float solution = rs.getFloat("solutionM");
			String supervisorComment = rs.getString("supervisorComment");
			String supervisorApproval = rs.getString("supervisorApproval");
			InterimReport interim = new InterimReport();
			interim.setTotalMarks(totalMarks);
			interim.setTitleM(title);
			interim.setAbstractM(abstractM);
			interim.setIntroductionM(intro);
			interim.setAnalysisM(analysis);
			interim.setSolutionM(solution);
			interim.setSupervisorComment(supervisorComment);
			interim.setSupervisorApproval(supervisorApproval);
			interim.setStudentId(studentId);
			interim.setFormName(formName);
			return interim;
		}
		return null;
	}
	
	
	public static void editInterimReport(Connection conn,InterimReport interim) throws SQLException {
		String sql = "update interimreport set formName=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, interim.getFormName());
		pstm.setInt(1, interim.getStudentId());
		pstm.executeUpdate();
	}	
	
	
	public static void deleteInterimReport(Connection conn, int studentId) throws SQLException {
		String sql = "Delete from interimreport where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		pstm.executeUpdate();
	}
	
	public static void insertMarkInterimMarks(Connection conn,int studentId, float titleM,float abstractM,float introM,float analysisM,float solutionM,float totalM) throws SQLException {
		String sql = "update interimreport set titleM=?,abstractM=?,introductionM=?,analysisM=?,solutionM=?,totalmarks=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setFloat(1,titleM);
		pstm.setFloat(2,abstractM);
		pstm.setFloat(3,introM);
		pstm.setFloat(4,analysisM);
		pstm.setFloat(5,solutionM);
		pstm.setFloat(6,totalM);
		pstm.setInt(7, studentId);
		pstm.executeUpdate();
		
	}
	
	public static List<InterimReport> getInterimSubmittedList(Connection conn) throws SQLException {
		String sql = "SELECT * FROM interimreport;";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<InterimReport> list = new ArrayList<InterimReport>();
		while(rs.next()){
			int studentId = rs.getInt("Student_idStudent");
			String formName = rs.getString("formName");
			float totalMarks = rs.getFloat("totalmarks");
			float title = rs.getFloat("titleM");
			float abstractM = rs.getFloat("abstractM");
			float intro = rs.getFloat("introductionM");
			float analysis = rs.getFloat("analysisM");
			float solution = rs.getFloat("solutionM");
			String supervisorComment = rs.getString("supervisorComment");
			String supervisorApproval = rs.getString("supervisorApproval");
			InterimReport interim = new InterimReport();
			interim.setTotalMarks(totalMarks);
			interim.setTitleM(title);
			interim.setAbstractM(abstractM);
			interim.setIntroductionM(intro);
			interim.setAnalysisM(analysis);
			interim.setSolutionM(solution);
			interim.setSupervisorComment(supervisorComment);
			interim.setSupervisorApproval(supervisorApproval);
			interim.setStudentId(studentId);
			interim.setFormName(formName);
			list.add(interim);
			
			
		}
		return list;
		
	}
	public static void approveInterimReport(Connection conn,String supervisorId,String approval ,String comment) throws SQLException {
		//String sql = "Delete from InterimReport where Student_idStudent=?";
		//supervisor has one student(assumption)
		String sql1 = "SELECT Student_idStudent FROM supervisor WHERE email = ?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setString(1,supervisorId);
		System.out.println("SQL eke bagyk hri");
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int stuId = rs1.getInt(1);

			String sql2 = "UPDATE interimreport SET supervisorApproval=?,supervisorComments=? WHERE Student_idStudent=?";
				PreparedStatement pstm2 = conn.prepareStatement(sql2);
				pstm2.setString(1,approval);
				pstm2.setString(2,comment);
				pstm2.setInt(3, stuId);
				
				pstm2.executeUpdate();



		}
	}
	
	
}
	
	
	
	
	


