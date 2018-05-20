package com.projectsupport.models;

public class ProjectProposal {
	private String projectTitle;
	private int noOfAttempts;
	private String previousDecision;
	private String earlierProjectTitle;
	private String motivation;
	private String objectives;
	private String scope;
	private String functionalities;
	private String deliverables;
	private String resources;
	private String evaluation;
	private int studentId;
	private String approval;
	private String supervisorComment;
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public String getSupervisorComment() {
		return supervisorComment;
	}
	public void setSupervisorComment(String supervisorComment) {
		this.supervisorComment = supervisorComment;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public int getNoOfAttempts() {
		return noOfAttempts;
	}
	public void setNoOfAttempts(int noOfAttempts) {
		this.noOfAttempts = noOfAttempts;
	}
	public String getPreviousDecision() {
		return previousDecision;
	}
	public void setPreviousDecision(String previousDecision) {
		this.previousDecision = previousDecision;
	}
	public String getEarlierProjectTitle() {
		return earlierProjectTitle;
	}
	public void setEarlierProjectTitle(String earlierProjectTitle) {
		this.earlierProjectTitle = earlierProjectTitle;
	}
	public String getMotivation() {
		return motivation;
	}
	public void setMotivation(String motivation) {
		this.motivation = motivation;
	}
	public String getObjectives() {
		return objectives;
	}
	public void setObjectives(String objectives) {
		this.objectives = objectives;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	public String getFunctionalities() {
		return functionalities;
	}
	public void setFunctionalities(String functionalities) {
		this.functionalities = functionalities;
	}
	public String getDeliverables() {
		return deliverables;
	}
	public void setDeliverables(String deliverables) {
		this.deliverables = deliverables;
	}
	public String getResources() {
		return resources;
	}
	public void setResources(String resources) {
		this.resources = resources;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
}
