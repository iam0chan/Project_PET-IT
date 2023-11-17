package com.pet.payment.model.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.Payment;
public class PaymentDao {
	
private Properties sql = new Properties();
	
	{
		String path = PaymentDao.class.getResource("/sql/payment/payment_sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}	
	public int insertPaymentResult(Connection conn, Payment p) {
		int result = 0;

		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertPaymentResult"));
			pstmt.setString(1, p.getImp_uid());
			pstmt.setInt(2, 78910);
			pstmt.setInt(3, p.getPaid_amount());
			pstmt.setString(4, p.getPay_method());
			pstmt.setInt(5, p.getApply_num());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
}
