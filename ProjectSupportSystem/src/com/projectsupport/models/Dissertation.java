package com.projectsupport.models;

public class Dissertation {
	private String formName;
	private float introduction;
	private float analysis;
	private float design;
	private float implementation;
	private float evaluation;
	private float conclusion;
	private float reference;
	private float appendices;
	private float general;
	private float total;
	private String supervisorComment;
	private String supervisorApproval;
	public String getSupervisorApproval() {
		return supervisorApproval;
	}
	public void setSupervisorApproval(String supervisorApproval) {
		this.supervisorApproval = supervisorApproval;
	}
	private int studentId;
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}

	public float getIntroduction() {
		return introduction;
	}
	public void setIntroduction(float introduction) {
		this.introduction = introduction;
	}
	public float getAnalysis() {
		return analysis;
	}
	public void setAnalysis(float analysis) {
		this.analysis = analysis;
	}
	public float getDesign() {
		return design;
	}
	public void setDesign(float design) {
		this.design = design;
	}
	public float getImplementation() {
		return implementation;
	}
	public void setImplementation(float implementation) {
		this.implementation = implementation;
	}
	public float getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(float evaluation) {
		this.evaluation = evaluation;
	}
	public float getConclusion() {
		return conclusion;
	}
	public void setConclusion(float conclusion) {
		this.conclusion = conclusion;
	}
	public float getReference() {
		return reference;
	}
	public void setReference(float reference) {
		this.reference = reference;
	}
	public float getAppendices() {
		return appendices;
	}
	public void setAppendices(float appendices) {
		this.appendices = appendices;
	}
	public float getGeneral() {
		return general;
	}
	public void setGeneral(float general) {
		this.general = general;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
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
	
	
}
