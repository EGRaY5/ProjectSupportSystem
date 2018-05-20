package com.projectsupport.models;
//Get variables from Answer Services and initialize get and set methods
public class QuestionNAnswer {
	private int questionId;
	private String reply;
	private String quest;
	private String userName;
		
		
	public String getUserName(){
		return userName;
	}

	public void setUserName(String userName){
		this.userName = userName;
	}

	public String getQuest() {
		return quest;
	}

	public void setQuest(String quest) {
		this.quest = quest;
	}

	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
		

}