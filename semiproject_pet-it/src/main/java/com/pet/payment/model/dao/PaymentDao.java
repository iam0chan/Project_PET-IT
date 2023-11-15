package com.pet.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import static com.pet.common.JDBCTemplate.*;

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
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertPaymentResult"));
			pstmt.setString(1, p.getImp_uid());
			pstmt.setInt(2, p.getMerchant_uid());
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
