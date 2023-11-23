package com.pet.admin.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.admin.model.dao.AdminDao;
import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;

public class AdminService {
	AdminDao dao = new AdminDao();
	
	public List<Order> selectOrderList(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Order> order = dao.selectOrderList(conn,cPage,numPerpage);
		close(conn);
		return order;
	}
	
	public int selectOrderCount() {
		Connection conn = getConnection();
		int result = dao.selectOrderCount(conn);
		close(conn);
		return result;
	}
	
	public List<OrderDetail> selectOrderDetailByNo(long orderNo) {
		Connection conn = getConnection();
		List<OrderDetail> result = dao.selectOrderDetailByNo(conn, orderNo);
		close(conn);
		return result;
	}
	
	public List<Payment>selectPaymentByNo(long orderNo){
		Connection conn = getConnection();
		List<Payment> result = dao.selectPaymentByNo(conn, orderNo);
		close(conn);
		return result;
	}
	
	public List<Order>selectOrderByNo(long orderNo){
		Connection conn = getConnection();
		List<Order> result = dao.selectOrderByNo(conn, orderNo);
		close(conn);
		return result;
	}
	
	public int updateOrder(Order o) {
		Connection conn = getConnection();
		int result = dao.updateOrder(conn,o);
		close(conn);
		return result;
	}
	
	public int deleteOrderList (long[] orderArr) {
		Connection conn = getConnection();
		int result=dao.deleteOrderList(conn,orderArr);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteProductList (String[] productArr) {
		Connection conn = getConnection();
		int result=dao.deleteProductList(conn,productArr);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
