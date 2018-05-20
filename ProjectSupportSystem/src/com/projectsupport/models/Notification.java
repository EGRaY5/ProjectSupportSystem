package com.projectsupport.models;

public class Notification {
	private int studentID;
	private String name;
	
	
	private String supervisorID;
	private String report;
	private String approval;

	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getSupervisorID() {
		return supervisorID;
	}
	public void setSupervisorID(String supervisorID) {
		this.supervisorID = supervisorID;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
