package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.projectsupport.models.ProjectPlan;


public class ProjectPlanServices {
	public static void 	insertProjectPlan(Connection conn,ProjectPlan plan) throws SQLException {
		String sql = "insert into plan (startingDate1,endingDate1,startingDate2,endingDate2,startingDate3,endingDate3,startingDate4,endingDate4,startingDate5,endingDate5,startingDate6,endingDate6,startingDate7,endingDate7,startingDate8,endingDate8,startingDate9,endingDate9,startingDate10,endingDate10,Student_idStudent) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, plan.getStartingDate1());
		pstm.setString(2, plan.getEndingDate1());
		pstm.setString(3, plan.getStartingDate2());
		pstm.setString(4, plan.getEndingDate2());
		pstm.setString(5, plan.getStartingDate3());
		pstm.setString(6, plan.getEndingDate3());
		pstm.setString(7, plan.getStartingDate4());
		pstm.setString(8, plan.getEndingDate4());
		pstm.setString(9, plan.getStartingDate5());
		pstm.setString(10, plan.getEndingDate5());
		pstm.setString(11, plan.getStartingDate6());
		pstm.setString(12, plan.getEndingDate6());
		pstm.setString(13, plan.getStartingDate7());
		pstm.setString(14, plan.getEndingDate7());
		pstm.setString(15, plan.getStartingDate8());
		pstm.setString(16, plan.getEndingDate8());
		pstm.setString(17, plan.getStartingDate9());
		pstm.setString(18, plan.getEndingDate9());
		pstm.setString(19, plan.getStartingDate10());
		pstm.setString(20, plan.getEndingDate10());
		pstm.setInt(21, plan.getStudentId());
		pstm.executeUpdate();
		
	}
	
	public static ProjectPlan findProjectPlan(Connection conn,int studentId)throws SQLException {
		String sql = "select startingDate1,endingDate1,startingDate2,endingDate2,startingDate3,endingDate3,startingDate4,endingDate4,startingDate5,endingDate5,startingDate6,endingDate6,startingDate7,endingDate7,startingDate8,endingDate8,startingDate9,endingDate9,startingDate10,endingDate10 from plan where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, studentId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String startingDate1 = rs.getString("startingDate1");
			String endingDate1 = rs.getString("endingDate1");
			String startingDate2 = rs.getString("startingDate2");
			String endingDate2 = rs.getString("endingDate2");
			String startingDate3 = rs.getString("startingDate3");
			String endingDate3 = rs.getString("endingDate3");
			String startingDate4 = rs.getString("startingDate4");
			String endingDate4 = rs.getString("endingDate4");
			String startingDate5 = rs.getString("startingDate5");
			String endingDate5 = rs.getString("endingDate5");
			String startingDate6 = rs.getString("startingDate6");
			String endingDate6 = rs.getString("endingDate6");
			String startingDate7 = rs.getString("startingDate7");
			String endingDate7 = rs.getString("endingDate7");
			String startingDate8 = rs.getString("startingDate8");
			String endingDate8 = rs.getString("endingDate8");
			String startingDate9 = rs.getString("startingDate9");
			String endingDate9 = rs.getString("endingDate9");
			String startingDate10 = rs.getString("startingDate10");
			String endingDate10 = rs.getString("endingDate10");
			ProjectPlan plan = new ProjectPlan();
			plan.setStartingDate1(startingDate1);
			plan.setEndingDate1(endingDate1);
			plan.setStartingDate2(startingDate2);
			plan.setEndingDate2(endingDate2);
			plan.setStartingDate3(startingDate3);
			plan.setEndingDate3(endingDate3);
			plan.setStartingDate4(startingDate4);
			plan.setEndingDate4(endingDate4);
			plan.setStartingDate5(startingDate5);
			plan.setEndingDate5(endingDate5);
			plan.setStartingDate6(startingDate6);
			plan.setEndingDate6(endingDate6);
			plan.setStartingDate7(startingDate7);
			plan.setEndingDate7(endingDate7);
			plan.setStartingDate8(startingDate8);
			plan.setEndingDate8(endingDate8);
			plan.setStartingDate9(startingDate9);
			plan.setEndingDate9(endingDate9);
			plan.setStartingDate10(startingDate10);
			plan.setEndingDate10(endingDate10);
			return plan;
		}
		return null;
		
		
	}
	
	public static void editProjectPlan(Connection conn,ProjectPlan plan) throws SQLException{
		String sql = "update plan set startingDate1=?,endingDate1=?,startingDate2=?,endingDate2=?,startingDate3=?,endingDate3=?,startingDate4=?,endingDate4=?,startingDate5=?,endingDate5=?,startingDate6=?,endingDate6=?,startingDate7=?,endingDate7=?,startingDate8=?,endingDate8=?,startingDate9=?,endingDate9=?,startingDate10=?,endingDate10=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,plan.getStartingDate1());
		pstm.setString(2,plan.getEndingDate1());
		pstm.setString(3,plan.getStartingDate2());
		pstm.setString(4,plan.getEndingDate2());
		pstm.setString(5,plan.getStartingDate3());
		pstm.setString(6,plan.getEndingDate3());
		pstm.setString(7,plan.getStartingDate4());
		pstm.setString(8,plan.getEndingDate4());
		pstm.setString(9,plan.getStartingDate5());
		pstm.setString(10,plan.getEndingDate5());
		pstm.setString(11,plan.getStartingDate6());
		pstm.setString(12,plan.getEndingDate6());
		pstm.setString(13,plan.getStartingDate7());
		pstm.setString(14,plan.getEndingDate7());
		pstm.setString(15,plan.getStartingDate8());
		pstm.setString(16,plan.getEndingDate8());
		pstm.setString(17,plan.getStartingDate9());
		pstm.setString(18,plan.getEndingDate9());
		pstm.setString(19,plan.getStartingDate10());
		pstm.setString(20,plan.getEndingDate10());
		pstm.setInt(21,plan.getStudentId());
		pstm.executeUpdate();
	}
	
	public static void deleteProjectPlan(Connection conn,int StudentId) throws SQLException {
		String sql = "Delete from plan where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, StudentId);
		pstm.executeUpdate();
	}
	
	
}
