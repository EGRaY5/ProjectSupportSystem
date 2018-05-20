package com.projectsupport.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.projectsupport.models.Viva;


public class VivaServices{
	//insert inputed values to table
	public static void insertTime(Connection conn, Viva viva) throws SQLException{ 
		String sql = " INSERT INTO viva_time (id, name, selections) VALUES (?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, viva.getId());
		pstm.setString(2, viva.getName());
		String[] time = viva.getTime();
		String selections = "";
		for(int i=0; i<time.length; i++ ){
			selections += time[i]+" /  " ;
		}
		pstm.setString(3, selections);
		
		pstm.executeUpdate();
		
	}
	
	
	//update inserted values
	public static void editTime(Connection conn, Viva viva) throws SQLException{
		String sql = "UPDATE viva_time SET name=?, selections=? WHERE id=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		
		pstm.setInt(3, viva.getId());
		pstm.setString(1, viva.getName());
		String[] time = viva.getTime();
		String selections = "";
		for(int i=0; i<time.length; i++ ){
			selections += time[i]+" / " ;
		}
		pstm.setString(2, selections);
		
		pstm.executeUpdate();
	}
	
	
	//find that loged examinor has entered data before using user name
	public static Viva findtime(Connection conn, int id) throws SQLException{
		String sql  = "SELECT name,selections FROM viva_time WHERE id=?";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, id);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			String name = rs.getString("name");
			//String[] selections = rs.getString("selections");
			Viva viva = new Viva();
			viva.setName(name);
			//viva.setTime(selections);
			return viva;
		}
		return null;
	}
}
