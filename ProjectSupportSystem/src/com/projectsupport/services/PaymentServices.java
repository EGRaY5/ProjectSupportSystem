/*package com.projectsupport.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.projectsupport.models.Payment;

public class PaymentServices {
	
	public static void insertPayment(Connection conn, Payment payment) throws SQLException {
		String sql = "Insert into Payment(idPayment,amount,paidDate,Student_idStudent) values (?,?,?,?)";
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1,payment.getPaymentId());
	    pstm.setInt(2,payment.getAmount());
	    pstm.setString(3,payment.getPaidDate());
	    pstm.setInt(4,payment.getStudentId());
	    pstm.executeUpdate();
	}

}
*/