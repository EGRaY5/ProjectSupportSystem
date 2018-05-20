package com.projectsupport.services;

//Progress Report services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.projectsupport.models.ProgressReport;
import com.projectsupport.models.ProgressReportSub;
import com.projectsupport.models.ProjectPlan;


public class ProgressReportServices {
	public static void insertProgressReport(Connection conn,ProgressReport pro,ProjectPlan plan,ProgressReportSub submission) throws SQLException, ParseException {
		String sql = "Insert into progressreports (reportNo,workCarried,describeTheWork,problems,workPlannedButNotDone,workPlanned,marks,Student_idStudent) values (?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, pro.getReportNo());
		pstm.setString(2,pro.getWorkCarried());
		pstm.setString(3, pro.getDescribe());
		pstm.setString(4,pro.getProblems());
		pstm.setString(5,pro.getWorkPlannedButNotDone());
		pstm.setString(6,pro.getWorkPlanned());
		pstm.setFloat(7,MarkingAutomation(plan,pro,submission));
		pstm.setInt(8,pro.getStudentId());
		pstm.executeUpdate();
	}
	
	

	public static ProgressReport findProgressReport(Connection conn, int stundentID) throws SQLException {
		String sql1 = "select MAX(idProgressReports) from progressreports where Student_idStudent=?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setInt(1,stundentID);
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int latest = rs1.getInt(1);
			String sql2 = "select reportNo,workCarried,describeTheWork,problems,workPlannedButNotDone,workPlanned from progressreports where idProgressReports=?";
			PreparedStatement pstm2 = conn.prepareStatement(sql2);
			pstm2.setInt(1, latest);
			ResultSet rs2 = pstm2.executeQuery();
			while(rs2.next()){
				int reportNo = rs2.getInt("reportNo");
				String workCarried = rs2.getString("workCarried");
				String describe = rs2.getString("describeTheWork");
				String problems = rs2.getString("problems");
				String workPlannedButNotDone = rs2.getString("workPlannedButNotDone");
				String workPlanned = rs2.getString("workPlanned");
				//System.out.println(workPlanned);
				ProgressReport pro = new ProgressReport();
				pro.setReportNo(reportNo);
				pro.setWorkCarried(workCarried);
				pro.setDescribe(describe);
				pro.setProblems(problems);
				pro.setWorkPlannedButNotDone(workPlannedButNotDone);
				pro.setWorkPlanned(workPlanned);
				return pro;
			}
			
			}
				return null;
		}


	public static void editProgressReport(Connection conn, ProgressReport pro,ProjectPlan plan,ProgressReportSub submission) throws SQLException, ParseException {
		String sql1 = "select MAX(idProgressReports) from progressreports where Student_idStudent=?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setInt(1,pro.getStudentId());
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int latest = rs1.getInt(1);
			String sql2 = "Update progressreports set workCarried=?,describeTheWork=?,problems=?,workPlannedButNotDone=?,workPlanned=?,marks=? where idProgressReports=?";
			PreparedStatement pstm2 = conn.prepareStatement(sql2);
			pstm2.setString(1,pro.getWorkCarried());
			pstm2.setString(2, pro.getDescribe());
			pstm2.setString(3,pro.getProblems());
			pstm2.setString(4,pro.getWorkPlannedButNotDone());
			pstm2.setString(5,pro.getWorkPlanned());
			pstm2.setFloat(6,MarkingAutomation(plan,pro,submission));
			pstm2.setInt(7,latest);
			pstm2.executeUpdate();
		}
			
			
	}
	
	public static void 	deleteProgressReport(Connection conn,int studentId) throws SQLException {
		String sql1 = "select MAX(idProgressReports) from progressreports where Student_idStudent=?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setInt(1,studentId);
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int latest = rs1.getInt(1);
			String sql2 = "Delete from progressreports where idProgressReports=?";
			PreparedStatement pstm = conn.prepareStatement(sql2);
			pstm.setInt(1, latest);
			pstm.executeUpdate();
		}
	}
	
	public static void insertProgressReportSub(Connection conn,ProgressReportSub det) throws SQLException {
		String sql = "Insert into progressReportDetails (progressNo,endDate,endTime) values (?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1,det.getReportNo());
		pstm.setString(2, det.getEndDate());
		pstm.setString(3,det.getEndTime());
		pstm.executeUpdate();
		
	}
	
	public static void deleteProgressReportSub(Connection conn,int reportNo) throws SQLException {
		String sql = "Delete from progressreportdetails where progressNo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, reportNo);
		pstm.executeUpdate();
	}
	
	public static List<ProgressReportSub> findReportDetails(Connection conn) throws SQLException{
		String sql = "Select progressNo,endDate,endTime from progressreportdetails";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<ProgressReportSub> list = new ArrayList<ProgressReportSub>();
		while(rs.next()){
			int reportNo = rs.getInt("progressNo");
			String endDate = rs.getString("endDate");
			String endTime = rs.getString("endTime");
			ProgressReportSub reportDetails = new ProgressReportSub();
			reportDetails.setReportNo(reportNo);
			reportDetails.setEndDate(endDate);
			reportDetails.setEndTime(endTime);
			list.add(reportDetails);
		}
		return list;
	}
	
	public static ProgressReportSub findLatestReport(Connection conn) throws SQLException {
		String sql1 = "Select MAX(progressNo) from progressreportdetails";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int no = rs1.getInt(1);
			String sql2 = "select * from progressreportdetails where progressNo=?";
			PreparedStatement pstm2 = conn.prepareStatement(sql2);
			pstm2.setInt(1,no);
			ResultSet rs2 = pstm2.executeQuery();
			while(rs2.next()){
				int reportNo = rs2.getInt("progressNo");
				String endDate = rs2.getString("endDate");
				String endTime = rs2.getString("endTime");
				ProgressReportSub prsub = new ProgressReportSub();
				prsub.setReportNo(reportNo);
				prsub.setEndDate(endDate);
				prsub.setEndTime(endTime);
				return prsub;
			}
			
			
		}
		return null;
	}
	
	public static float MarkingAutomation(ProjectPlan plan,ProgressReport progressreport, ProgressReportSub submission) throws ParseException{
		if(progressreport.getWorkCarried().equals("Find a project and meet client")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate1());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
				
		}
		else if(progressreport.getWorkCarried().equals("Feasibility Study")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate2());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Gather client requirements")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate3());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Define scope")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate4());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Define users and use cases")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate5());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Requirement Analysis")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate6());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		
		else if(progressreport.getWorkCarried().equals("UI-Design")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate7());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("UI-Development")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate8());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Back-end Developmen")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate9());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		else if(progressreport.getWorkCarried().equals("Testing")){
			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date deadline = sdf.parse(submission.getEndDate());
			Date planDate = sdf.parse(plan.getEndingDate10());
			if(planDate.after(deadline) || planDate.equals(deadline)){
				return (float) 0.5;
			}
			else{
				return 0;
			}
		}
		return 0;
	}
	public static void insertMarks(Connection conn,ProjectPlan plan,ProgressReport progressreport, ProgressReportSub submission) throws ParseException,SQLException {
		float finalMarks = MarkingAutomation(plan,progressreport,submission);
		String sql = "Update progressreports set marks=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setFloat(1,finalMarks);
		pstm.setInt(2,progressreport.getStudentId());
		pstm.executeUpdate();
	}
	
	public static ProgressReportSub findProgressReportSub(Connection conn,int progressReportNo) throws SQLException {
		String sql = "Select * from progressreportdetails where progressNo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, progressReportNo);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()) {
			String endDate = rs.getString("endDate");
			String endTime = rs.getString("endTime");
			ProgressReportSub submission = new ProgressReportSub();
			submission.setReportNo(progressReportNo);
			submission.setEndDate(endDate);
			submission.setEndTime(endTime);
			return submission;
			
		}
		return null;
	}
	
	public static List<ProgressReport> getProgressReportList(Connection conn,int studentId) throws SQLException {
		String sql = "select reportNo,marks,SupervisorsState,SupervisorRemarks from progressreports where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		ResultSet rs = pstm.executeQuery();
		List<ProgressReport> list = new ArrayList<ProgressReport>();
		while(rs.next()){
			int reportNo = rs.getInt("reportNo");
			float marksObtained  = rs.getFloat("marks");
			String supervisorState = rs.getString("SupervisorsState");
			String supervisorRemarks = rs.getString("SupervisorRemarks");
			ProgressReport progressreport = new ProgressReport();
			progressreport.setStudentId(studentId);
			progressreport.setReportNo(reportNo);
			progressreport.setMark(marksObtained);
			progressreport.setSupervisorState(supervisorState);
			progressreport.setSupervisorRemark(supervisorRemarks);
			list.add(progressreport);
		}
		return list;
	}
	
	public static ProgressReport getReportByIdandNo(Connection conn,int studentId,int reportNo) throws SQLException{
		String sql = "select * from progressreports where Student_idStudent=? and reportNo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		pstm.setInt(2, reportNo);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			float marksObtained  = rs.getFloat("marks");
			String workCarried = rs.getString("workCarried");
			String description = rs.getString("describeTheWork");
			String problems = rs.getString("problems");
			String workPlannedNotDone = rs.getString("workPlannedButNotDone");
			String workPlanned = rs.getString("workPlanned");
			String supervisorState = rs.getString("SupervisorsState");
			String supervisorRemarks = rs.getString("SupervisorRemarks");
			ProgressReport progressreport = new ProgressReport();
			progressreport.setStudentId(studentId);
			progressreport.setReportNo(reportNo);
			progressreport.setWorkCarried(workCarried);
			progressreport.setDescribe(description);
			progressreport.setProblems(problems);
			progressreport.setWorkPlannedButNotDone(workPlannedNotDone);
			progressreport.setWorkPlanned(workPlanned);
			progressreport.setMark(marksObtained);
			progressreport.setSupervisorState(supervisorState);
			progressreport.setSupervisorRemark(supervisorRemarks);
			return progressreport;
		}
		return null;
	}
	
	public static void insertMarks(Connection conn, int studentId,int reportNo,float mark) throws SQLException{
		String sql = "update progressreports set marks=? where Student_idStudent=? and reportNo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setFloat(1, mark);
		pstm.setInt(2, studentId);
		pstm.setInt(3, reportNo);
		pstm.executeUpdate();
	}
	
	public static float getProgressReportMarks(Connection conn,int studentId,int reportNo) throws SQLException{
		String sql = "select marks from progressreports where Student_idStudent=? and reportNo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		pstm.setInt(2, reportNo);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			float prmarks = rs.getFloat("marks");
			return prmarks;
		
		}
		return 0;
	}
	
	public static void approveProgressReport(Connection conn,String supervisorId,String approval ,String comment) throws SQLException {
		//String sql = "Delete from InterimReport where Student_idStudent=?";
		//supervisor has one student(assumption)
		String sql1 = "SELECT student_idStudent FROM supervisor WHERE email = ?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setString(1,supervisorId);
		System.out.println("SQL eke bagyk hri");
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int stuId = rs1.getInt(1);

			String sql2 = "UPDATE progressreports SET supervisorApproval=?,supervisorComment=? WHERE Student_idStudent=?";
				PreparedStatement pstm2 = conn.prepareStatement(sql2);
				pstm2.setString(1,approval);
				pstm2.setString(2,comment);
				pstm2.setInt(3, stuId);
				
				pstm2.executeUpdate();



		}
	}

}

	
	


