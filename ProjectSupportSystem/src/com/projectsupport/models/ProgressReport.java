package com.projectsupport.models;

public class ProgressReport {
	private int reportNo;
	private String workCarried;
	private String describe;
	private String problems;
	private String workPlannedButNotDone;
	private String workPlanned;
	private float mark;
	private int studentId;
	private String supervisorState;
	private String supervisorRemark;
	
	public String getSupervisorState() {
		return supervisorState;
	}
	public void setSupervisorState(String supervisorState) {
		this.supervisorState = supervisorState;
	}
	public String getSupervisorRemark() {
		return supervisorRemark;
	}
	public void setSupervisorRemark(String supervisorRemark) {
		this.supervisorRemark = supervisorRemark;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getWorkCarried() {
		return workCarried;
	}
	public void setWorkCarried(String workCarried) {
		this.workCarried = workCarried;
	}
	public String getProblems() {
		return problems;
	}
	public void setProblems(String problems) {
		this.problems = problems;
	}
	public String getWorkPlannedButNotDone() {
		return workPlannedButNotDone;
	}
	public void setWorkPlannedButNotDone(String workPlannedButNotDone) {
		this.workPlannedButNotDone = workPlannedButNotDone;
	}
	public String getWorkPlanned() {
		return workPlanned;
	}
	public void setWorkPlanned(String workPlanned) {
		this.workPlanned = workPlanned;
	}
	public float getMark() {
		return mark;
	}
	public void setMark(float mark) {
		this.mark = mark;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

}
