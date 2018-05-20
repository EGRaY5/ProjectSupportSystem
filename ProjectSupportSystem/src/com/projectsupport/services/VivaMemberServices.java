package com.projectsupport.services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;

import com.projectsupport.models.Message;
import com.projectsupport.models.User;
import com.projectsupport.models.VivaMember;



public class VivaMemberServices {
	
	public static void insertVivaMember(Connection conn,VivaMember viva) throws SQLException {
		String sql = "Insert into viva_member(id,fname,lname,email,department,position) values (?,?,?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1,viva.getId());
		pstm.setString(2,viva.getFname());
		pstm.setString(3,viva.getLname());
		pstm.setString(4,viva.getEmail());
		pstm.setString(5,viva.getDepartment());
		pstm.setString(6,viva.getPosition());
		pstm.executeUpdate();

	}	

}
