package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projectsupport.models.Question;


public class QuestionServices {
	
	public static List<Question> getQuestionList(Connection conn) throws SQLException {
		String sql = "select q_id,question,userName from question";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<Question> list = new ArrayList<Question>();
		while(rs.next()){
			int questionId = rs.getInt("q_id");
			String quest = rs.getString("question");
			String userName = rs.getString("userName");
			Question question = new Question();
			question.setQuestionId(questionId);
			question.setQuest(quest);
			question.setUserName(userName);
			list.add(question);
			
		}
		return list;
		
	}
	
}
