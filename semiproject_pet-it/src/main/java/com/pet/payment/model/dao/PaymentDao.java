package com.pet.payment.model.dao;

import static com.pet.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
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
	
	public int insertOrderResult(Connection conn, Order o) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertOrderResult"));
			pstmt.setLong(1, o.getOrderNo());
			pstmt.setString(2, o.getOrderId());
			pstmt.setString(3, o.getOrderName());
			pstmt.setString(4, o.getOrderPhone());
			pstmt.setString(5, o.getOrderZipcode());
			pstmt.setString(6, o.getOrderAddr());
			pstmt.setString(7, o.getOrderDefAddr());
			pstmt.setString(8, o.getOrderEmail());
			pstmt.setInt(9, o.getOrderTotalPrice());
			pstmt.setString(10, o.getDeliveryReq());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertPaymentResult(Connection conn, Payment p) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertPaymentResult"));
			pstmt.setString(1, p.getImp_uid());
			pstmt.setLong(2, p.getMerchant_uid());
			pstmt.setInt(3, p.getPaid_amount());
			pstmt.setString(4, p.getPay_method());
			pstmt.setDate(5, p.getPaid_at());
			pstmt.setInt(6, p.getApply_num());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertOrderDetail(Connection conn, OrderDetail od) {
		int result = 0;
		PreparedStatement pstmt = null;

      try {
         pstmt = conn.prepareStatement(sql.getProperty("insertOrderDetail"));
         pstmt.setLong(1, od.getOrderNo());
         pstmt.setString(2, od.getProductNo());
         pstmt.setInt(3, od.getDetailPrice());
         pstmt.setInt(4, od.getDetailCount());
         pstmt.setString(5, od.getProductOption());
         
         result = pstmt.executeUpdate();
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      return result;
   }
	
	public boolean insertOrderList(Connection conn, List<OrderDetail>orderList) {
		int[] result = null;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertOrderList"));
			
			for (OrderDetail od : orderList) {
			    pstmt.setLong(1, od.getOrderNo());
			    pstmt.setString(2, od.getProductNo());
			    pstmt.setInt(3, od.getDetailPrice());
			    pstmt.setInt(4, od.getDetailCount());
			    pstmt.setString(5, od.getProductOption());
				pstmt.addBatch();
			}
		    result = pstmt.executeBatch();
		     
		}catch(SQLException e) {
		    e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return Arrays.stream(result).allMatch(count -> count > 0);
	}
	
	private static Order getOrders(ResultSet rs) throws SQLException {
		return Order.builder()
				.orderNo(rs.getLong("PURCHASE_NO"))
				.orderId(rs.getString("member_id"))
				.orderName(rs.getString("purchase_name"))
				.orderPhone(rs.getString("purchase_phone"))
				.orderZipcode(rs.getString("purchase_zip_code"))
				.orderAddr(rs.getString("purchase_addr"))
				.orderDefAddr(rs.getString("purchase_def_addr"))
				.orderEmail(rs.getString("purchase_email"))
				.orderTotalPrice(rs.getInt("purchase_total_price"))
				.deliveryReq(rs.getString("purchase_req"))
				.build();
	}
}