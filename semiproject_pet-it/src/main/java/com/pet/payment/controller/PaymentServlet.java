package com.pet.payment.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Date;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;
import com.pet.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentDemo
 */
@WebServlet("/payment.do")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PaymentServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		//주문테이블에 넣을 정보 가져오기
		String o = request.getParameter("order");
		Order order = gson.fromJson(o, Order.class);
		
		//주문상세 정보 가져오기
		String od = request.getParameter("orderDetail");
		OrderDetail orderDetail = gson.fromJson(od, OrderDetail.class);
		
		//주문상세객체배열 가져오기
		String orderArr = request.getParameter("orderArr");
        List<OrderDetail>orderList = null;
		OrderDetail[] orderArray = gson.fromJson(orderArr, OrderDetail[].class);
		orderList = Arrays.asList(orderArray);
        
        
		//결제테이블에 넣을 정보 가져오기
		String imp_uid = request.getParameter("imp_uid");
	    long merchant_uid = Long.parseLong(request.getParameter("merchant_uid"));
	    int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
	    int apply_num = 0;
	    if(request.getParameter("apply_num")!="") {
	    	apply_num = Integer.parseInt(request.getParameter("apply_num"));
	    }
	    String pay_method = request.getParameter("pay_method");
	    long timestamp = Long.parseLong(request.getParameter("paid_at")); // UNIX 타임스탬프 값으로 되어있음.
	    Date paid_at = new Date(timestamp * 1000); // UNIX 타임스탬프를 date에 맞게 변환
	    
	    Payment payment = Payment.builder()
	    		.imp_uid(imp_uid)
	    		.merchant_uid(merchant_uid)
	    		.paid_amount(paid_amount)
	    		.apply_num(apply_num)
	    		.pay_method(pay_method)
	    		.paid_at(paid_at)
	    		.build();
	    
	    //주문정보, 결제DB저장 service실행
	    int result = new PaymentService().insertPaymentResult(order, payment);
	    
	    if(result>0) System.out.println("결제DB저장 성공");
	    else System.out.println("결제DB저장 실패");
	    System.out.println("주문DB저장값: "+ order);
	    System.out.println("결제DB저장값: "+ payment);
	    System.out.println("주문리스트: "+ orderList);
	    
	    response.setContentType("application/json;charset=utf-8");
		request.getSession().setAttribute("orderDetail", orderDetail);
		request.getSession().setAttribute("payment", payment);
		
		if(!orderList.isEmpty()) {
			request.getSession().setAttribute("orderList", orderList);
		}
		
	    gson.toJson(Map.of("result",true),response.getWriter());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

