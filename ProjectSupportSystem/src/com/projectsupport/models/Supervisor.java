package com.projectsupport.models;

public class Supervisor {
	int studentId;
	String firstName;
	String lastName;
	String email;
	String mobileNo;
	String addressLine1;
	String addressLine2;
	String city;
	String agreementFormPath;
	String approval;
	String supervisorComment;
	public String getAgreementFormPath() {
		return agreementFormPath;
	}
	public void setAgreementFormPath(String agreementFormPath) {
		this.agreementFormPath = agreementFormPath;
	}
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
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return this.city;
	}
	public void setCity(String City) {
		this.city = City;
	}
	
	public String getAgreementForm() {
		return agreementFormPath;
	}
	public void setAgreementForm(String path) {
		this.agreementFormPath = path;
	}
	
	}
