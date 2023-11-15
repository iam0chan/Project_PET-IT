package com.pet.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.payment.model.dto.Payment;
import com.pet.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentDemo
 */
@WebServlet("/paydemo.do")
public class PaymentDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentDemo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imp_uid = request.getParameter("imp_uid");
	    String merchant_uid = request.getParameter("merchant_uid");
	    int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
	    String apply_num = request.getParameter("apply_num");

	    System.out.println("imp_uid: " + imp_uid);
	    System.out.println("merchant_uid: " + merchant_uid);
	    System.out.println("paid_amount: " + paid_amount);
	    System.out.println("apply_num: " + apply_num);

	    Payment p = Payment.builder()
	    		.imp_uid(imp_uid)
	    		.merchant_uid(merchant_uid)
	    		.paid_amount(paid_amount)
	    		.apply_num(apply_num)
	    		.build();
	    
	    int result = new PaymentService().insertPaymentResult(p);
	    
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
