package com.pet.payment.service;


import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.pet.payment.model.dao.PaymentDao;
import com.pet.payment.model.dto.Order;
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
}
