package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.projectsupport.models.ProjectProposal;

public class ProjectProposalServices {
	
	public static void insertProjectProposal(Connection conn,ProjectProposal proposal) throws SQLException {
		String sql = "insert into projectproposal (projectTitle,noOfAttempts,previousDecision,earlierProjectTitle,motivationForTheProject,objectives,scope,functionalities,deliverables,resources,selfEvaluation,Student_idStudent) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,proposal.getProjectTitle());
		pstm.setInt(2,proposal.getNoOfAttempts());
		pstm.setString(3,proposal.getPreviousDecision());
		pstm.setString(4,proposal.getEarlierProjectTitle());
		pstm.setString(5,proposal.getMotivation());
		pstm.setString(6,proposal.getObjectives());
		pstm.setString(7,proposal.getScope());
		pstm.setString(8,proposal.getFunctionalities());
		pstm.setString(9,proposal.getDeliverables());
		pstm.setString(10,proposal.getResources());
		pstm.setString(11,proposal.getEvaluation());
		pstm.setInt(12,proposal.getStudentId());
		pstm.executeUpdate();
		
		
		String sql2="select SurName,supervisorID from student where idStudent=?";
		PreparedStatement pstm2 = conn.prepareStatement(sql2);
		pstm2.setInt(1,proposal.getStudentId());
		
		ResultSet rs1 = pstm2.executeQuery();
		if(rs1.next()){
		String name = rs1.getString(1);	
		String superId = rs1.getString(2);
		String sql1="Insert into submission(Student_idStudent,name,supervisorID,report,approval) values(?,?,?,'interim report','not')";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		
		pstm1.setInt(1,proposal.getStudentId());
		pstm1.setString(2,name);
		pstm1.setString(3,superId);
		
		pstm1.executeUpdate();
		}
		
		
		
		
		
		
	}
	
	public static ProjectProposal findProjectProposal(Connection conn,int userId) throws SQLException {
		String sql = "select projectTitle,noOfAttempts,previousDecision,earlierProjectTitle,motivationForTheProject,objectives,scope,functionalities,deliverables,resources,selfEvaluation from projectproposal where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, userId);
		ResultSet rs = pstm.executeQuery();
		while(rs.next()){
			String projectTitle = rs.getString("projectTitle");
			int noOfAttempts = rs.getInt("noOfAttempts");
			String previousDecision = rs.getString("previousDecision");
			String earlierProjectTitle = rs.getString("earlierProjectTitle");
			String motivationForTheProject = rs.getString("motivationForTheProject");
			String objectives = rs.getString("objectives");
			String scope = rs.getString("scope");
			String functionalities = rs.getString("functionalities");
			String deliverables =  rs.getString("deliverables");
			String resources = rs.getString("resources");
			String selfEvaluation = rs.getString("selfEvaluation");
			ProjectProposal proposal =  new ProjectProposal();
			proposal.setProjectTitle(projectTitle);
			proposal.setNoOfAttempts(noOfAttempts);
			proposal.setPreviousDecision(previousDecision);
			proposal.setEarlierProjectTitle(earlierProjectTitle);
			proposal.setMotivation(motivationForTheProject);
			proposal.setObjectives(objectives);
			proposal.setScope(scope);
			proposal.setFunctionalities(functionalities);
			proposal.setDeliverables(deliverables);
			proposal.setResources(resources);
			proposal.setEvaluation(selfEvaluation);
			return proposal;
		}
		return null;

	}
	public static void editProjectProposal(Connection conn,ProjectProposal proposal) throws SQLException {
		String sql = "update projectproposal set projectTitle=?,noOfAttempts=?,previousDecision=?,earlierProjectTitle=?,motivationForTheProject=?,objectives=?,scope=?,functionalities=?,deliverables=?,resources=?,selfEvaluation=? where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, proposal.getProjectTitle());
		pstm.setInt(2, proposal.getNoOfAttempts());
		pstm.setString(3, proposal.getPreviousDecision());
		pstm.setString(4, proposal.getEarlierProjectTitle());
		pstm.setString(5, proposal.getMotivation());
		pstm.setString(6, proposal.getObjectives());
		pstm.setString(7, proposal.getScope());
		pstm.setString(8, proposal.getFunctionalities());
		pstm.setString(9, proposal.getDeliverables());
		pstm.setString(10, proposal.getResources());
		pstm.setString(11, proposal.getEvaluation());
		pstm.setInt(12, proposal.getStudentId());
		pstm.executeUpdate();
		
	}
	
	public static void deleteProgressReport(Connection conn,int StudentId) throws SQLException {
		String sql = "Delete from projectproposal where Student_idStudent=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, StudentId);
		pstm.executeUpdate();
	}
	public static void approveProjectProposal(Connection conn,String supervisorId,String approval ,String comment) throws SQLException {
		//String sql = "Delete from InterimReport where Student_idStudent=?";
		//supervisor has one student(assumption)
		String sql1 = "SELECT Student_idStudent FROM supervisor WHERE idSupervisor = ?";
		PreparedStatement pstm1 = conn.prepareStatement(sql1);
		pstm1.setString(1,supervisorId);
		//System.out.println("SQL eke bagyk hri");
		ResultSet rs1 = pstm1.executeQuery();
		if(rs1.next()){
			int stuId = rs1.getInt(1);

			String sql2 = "UPDATE projectproposal SET supervisorApproval=?,supervisorComment=? WHERE Student_idStudent=?";
				PreparedStatement pstm2 = conn.prepareStatement(sql2);
				pstm2.setString(1,approval);
				pstm2.setString(2,comment);
				pstm2.setInt(3, stuId);
				
				pstm2.executeUpdate();}
		}

}
