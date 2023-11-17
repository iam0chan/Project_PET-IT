package com.pet.payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pet.payment.model.dto.Payment;
import com.pet.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentDemo
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String imp_uid = request.getParameter("imp_uid");
	    int merchant_uid = Integer.parseInt(request.getParameter("merchant_uid"));
	    int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
	    int apply_num = Integer.parseInt(request.getParameter("apply_num"));
	    String pay_method = request.getParameter("pay_method");
	    long timestamp = Long.parseLong(request.getParameter("paid_at")); // UNIX 타임스탬프 값
	    Date paid_at = new Date(timestamp * 1000); // UNIX 타임스탬프를 밀리초 단위로 변환하여 Date 객체 생성
	    
	    Payment p = Payment.builder()
	    		.imp_uid(imp_uid)
	    		.merchant_uid(merchant_uid)
	    		.paid_amount(paid_amount)
	    		.apply_num(apply_num)
	    		.pay_method(pay_method)
	    		.paid_at(paid_at)
	    		.build();

//	    private String orderName;
//		private String orderZipcode;
//		private String orderAddr;
//		private String orderDefAddr;
//		private String orderPhone;
//		private String orderEmail;
//		private int orderTotalPrice;
//		private String textDelivery;
	    
	    int result = new PaymentService().insertPaymentResult(p);
	    
	    if(result>0) System.out.println("DB저장 성공");
	    else System.out.println("DB저장 실패");
	    System.out.println("DB저장값: "+ p);

	    Gson gson = new Gson();
//		String data = gson.toJson(p);
		response.setContentType("application/json;charset=utf-8");
//		gson.toJson(p,response.getWriter());
//		System.out.println(gson.toJson(p));
	    
		request.getSession().setAttribute("payment", p);
	    gson.toJson(Map.of("result",true),response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}



