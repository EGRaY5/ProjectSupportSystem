package com.projectsupport.models;

public class Message {
	private String header;
	private String detail;
	private String UserName;
	private int messsageId;
	
	public int getMesssageId() {
		return messsageId;
	}
	public void setMesssageId(int messsageId) {
		this.messsageId = messsageId;
	}
	public String getHeader() {
		return header;
	}
	public void setHeader(String header) {
		this.header = header;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	
	
}
