package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.projectsupport.models.Message;


public class MessageServices {
	public static void insertMessage(Connection conn,Message message) throws SQLException {
		String sql = "Insert into messages(header,detail,User_userName) values (?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,message.getHeader());
		pstm.setString(2,message.getDetail());
		pstm.setString(3,message.getUserName());
		pstm.executeUpdate();

	}
	
	public static void deleteMessages(Connection conn, int messageId) throws SQLException {
		String sql = "Delete from messages where idMessages=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1,messageId);
		pstm.executeUpdate();
	}
	
	public static List<Message> findMessages(Connection conn) throws SQLException{
		String sql = "Select idMessages,header,detail from messages";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		List<Message> list = new ArrayList<Message>();
		while(rs.next()){
			int msgId = rs.getInt("idMessages");
			String header = rs.getString("header");
			String detail = rs.getString("detail");
			Message message = new Message();
			message.setHeader(header);
			message.setDetail(detail);
			message.setMesssageId(msgId);
			list.add(message);
		}
		return list;
	}
}

	
