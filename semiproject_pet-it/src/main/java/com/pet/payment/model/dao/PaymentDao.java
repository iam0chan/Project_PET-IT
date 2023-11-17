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
<<<<<<< HEAD
	
	public int insertOrderResult(Connection conn, Order o) {
		int result=0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertOrderResult"));
			pstmt.setString(1, "taeyoons");
			pstmt.setString(2, o.getOrderName());
			pstmt.setString(3, o.getOrderPhone());
			pstmt.setString(4, o.getOrderZipcode());
			pstmt.setString(5, o.getOrderAddr());
			pstmt.setString(6, o.getOrderDefAddr());
			pstmt.setString(7, o.getOrderEmail());
			pstmt.setInt(8, o.getOrderTotalPrice());
			pstmt.setString(9, o.getTextDelivery());
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
=======
>>>>>>> refs/heads/dev
	
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
