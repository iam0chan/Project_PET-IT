package com.pet.admin.model.dao;

import static com.pet.common.JDBCTemplate.close;

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

import com.pet.payment.model.dao.PaymentDao;
import com.pet.payment.model.dto.Order;

public class AdminDao {
	
	private Properties sql = new Properties();
	{
		String path = PaymentDao.class.getResource("/sql/admin/admin_sql.properties").getPath();
		try(FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	

	public List<Order> selectOrderList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Order>orders = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectOrderList"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage * numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				orders.add(getOrders(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return orders;
	}
	
	public int selectOrderCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectOrderCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int deleteOrderList(Connection conn, long[]orderArr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("deleteOrders"));
			
			for(long oa : orderArr) {
				pstmt.setLong(1, oa);
				pstmt.addBatch();
				pstmt.clearParameters();
			}
			int[]results = pstmt.executeBatch();
			result = 1;
			
			for(int i: results) {
				if(i==-2) {
					i=1;
				}else if(i==-3) {
					i=0;
				}
				result*=i;
			}
			if(result>0)System.out.println("DAO : db결과성공");
			else System.out.println("DAO : db결과실패");
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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
