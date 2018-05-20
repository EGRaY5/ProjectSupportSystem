package com.projectsupport.models;

public class InterimReport {
	private String formName;
	private int studentId;
	private float totalMarks;
	private float titleM;
	private float abstractM;
	private float introductionM;
	private float analysisM;
	private float solutionM;
	private String supervisorApproval;
	private String supervisorComment;
	
	
	public String getSupervisorApproval() {
		return supervisorApproval;
	}
	public void setSupervisorApproval(String supervisorApproval) {
		this.supervisorApproval = supervisorApproval;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getSupervisorComment() {
		return supervisorComment;
	}
	public void setSupervisorComment(String supervisorComment) {
		this.supervisorComment = supervisorComment;
	}
	
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public float getTotalMarks() {
		return totalMarks;
	}
	public void setTotalMarks(float totalMarks) {
		this.totalMarks = totalMarks;
	}
	public float getTitleM() {
		return titleM;
	}
	public void setTitleM(float titleM) {
		this.titleM = titleM;
	}
	public float getAbstractM() {
		return abstractM;
	}
	public void setAbstractM(float abstractM) {
		this.abstractM = abstractM;
	}
	public float getIntroductionM() {
		return introductionM;
	}
	public void setIntroductionM(float introductionM) {
		this.introductionM = introductionM;
	}
	public float getAnalysisM() {
		return analysisM;
	}
	public void setAnalysisM(float analysisM) {
		this.analysisM = analysisM;
	}
	public float getSolutionM() {
		return solutionM;
	}
	public void setSolutionM(float solutionM) {
		this.solutionM = solutionM;
	}
	
}
