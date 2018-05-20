package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projectsupport.models.QuestionNAnswer;
import com.projectsupport.models.Student;


public class AnswerServices {
	//QuestionNAnswer is the model I createed and getAnswerList is the method name
	public static List<QuestionNAnswer> getAnswerList(Connection conn) throws SQLException {
		//Getting data from the database question table and answer table and left join and create one table
		String sql = "select question.q_id,question.question,question.userName,answer.reply from question LEFT JOIN answer ON question.q_id=answer.q_id";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		//Creating a List as list using model QuestionNAnswer
		List<QuestionNAnswer> list = new ArrayList<QuestionNAnswer>();
		while(rs.next()){
			//Initializing variables to column names in database tables joined by left join
			int questionId = rs.getInt("q_id");
			String quest = rs.getString("question"); 
			String userName = rs.getString("userName"); 
			String reply = rs.getString("reply");
			QuestionNAnswer qanda = new QuestionNAnswer();
			qanda.setQuestionId(questionId);
			qanda.setQuest(quest);
			qanda.setUserName(userName);
			qanda.setReply(reply);
			list.add(qanda);
			
		}
		return list;
		
	}
	
	public static void insertNewQuestion(Connection conn,QuestionNAnswer question) throws SQLException {
		String sql = "Insert into question (question,userName) values (?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,question.getQuest());
		pstm.setString(2,question.getUserName());
		pstm.executeUpdate();
	}
	
	public static void insertNewAnswer(Connection conn,QuestionNAnswer question) throws SQLException {
		String sql = "Insert into answer (reply) values (?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,question.getReply());
		pstm.executeUpdate();
	}
	
}