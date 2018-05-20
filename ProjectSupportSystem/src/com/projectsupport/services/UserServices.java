package com.projectsupport.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import com.projectsupport.models.User;



public class UserServices {    //User services 
	
	public static User findUser(Connection conn,String userName,String password) throws SQLException{
		String sql = "Select userName,password,position from user where userName=? and password=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();
		
		if(rs.next()){
			String pos = rs.getString("position");
			User loginUser = new User();
			loginUser.setUserName(userName);
			loginUser.setPassword(password);
			loginUser.setPosition(pos);
			return loginUser;
		}
		return null;
	}
	
	
	  public static User findUser(Connection conn, String userName) throws SQLException {
		  String sql = "Select userName, password, position from user where userName =?";
		  PreparedStatement pstm = conn.prepareStatement(sql);
	      pstm.setString(1, userName);
	      ResultSet rs = pstm.executeQuery();
	      if (rs.next()) {
	          String password = rs.getString("Password");
	          String position = rs.getString("position");
	          User loginUser = new User();
	          loginUser.setUserName(userName);
	          loginUser.setPassword(password);
	          loginUser.setPosition(position);
	          return loginUser;
	      }
	      return null;
	  }
	 
	  public static void InsertUser(Connection conn,String userName,String password,String position) throws SQLException{
		  String sql = "insert into user (UserName,password,position) values (?,?,?)";
		  PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,userName);
			pstm.setString(2,password);
			pstm.setString(3,position);
			pstm.executeUpdate();
	  }
	  public static List<User> findUsers(Connection conn) throws SQLException{
			String sql = "Select userName,password,position from user";
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			List<User> list = new ArrayList<User>();
			while(rs.next()){
				String userName = rs.getString("userName");
				String password = rs.getString("password");
				String position = rs.getString("position");
				User newUser = new User();
				newUser.setUserName(userName);
				newUser.setPassword(password);
				newUser.setPosition(position);
				list.add(newUser);
			}
			return list;
		}
	  public static void deleteUsers(Connection conn, String userName) throws SQLException {
			String sql = "Delete from user where userName=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,userName);
			pstm.executeUpdate();
		}
	  
	  public static void insertUser(Connection conn,User user) throws SQLException {
			String sql = "Insert into user(userName,password,position) values (?,?,?)";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,user.getUserName());
			pstm.setString(2,user.getPassword());
			pstm.setString(3,user.getPosition());
			pstm.executeUpdate();

		}

} 
