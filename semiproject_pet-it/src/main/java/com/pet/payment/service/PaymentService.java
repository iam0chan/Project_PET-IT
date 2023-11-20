package com.pet.payment.service;


import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.payment.model.dao.PaymentDao;
import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;

public class PaymentService {
	
	private PaymentDao dao = new PaymentDao();
	
	public int insertPaymentResult(Order o, Payment p) {
		Connection conn = getConnection();
		
		int result = dao.insertOrderResult(conn,o);
		int paymentResult = 0;
		
		if(result>0) {
			paymentResult = dao.insertPaymentResult(conn,p);
			if(paymentResult>0) {
				commit(conn);
			}
		}else { 
			rollback(conn);
		}
		return result;
	}
	
	public boolean insertOrderDetail(List<OrderDetail> ol, OrderDetail od) {
		Connection conn = getConnection();
		boolean resultOl = false;
		if(ol.size()<2) {
			int result = dao.insertOrderDetail(conn,od);
			if(result>0) {
				commit(conn);
				resultOl = true;
			}else {
				rollback(conn);
			}
		}else {
			resultOl = (boolean) dao.insertOrderList(conn,ol);
			if(resultOl) commit(conn);
			else rollback(conn);
		}
		return resultOl;
	}
}
