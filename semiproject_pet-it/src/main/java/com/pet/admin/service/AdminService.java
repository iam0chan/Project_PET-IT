package com.pet.admin.service;

import static com.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.pet.admin.model.dao.AdminDao;
import com.pet.payment.model.dto.Order;

public class AdminService {
	AdminDao dao = new AdminDao();
	
	public int deleteOrderList (long[] orderArr) {
		Connection conn = getConnection();
		int result=dao.deleteOrderList(conn,orderArr);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
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
}
