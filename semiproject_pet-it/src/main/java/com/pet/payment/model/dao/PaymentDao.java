package com.pet.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

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
		
		return result;
	}
}
