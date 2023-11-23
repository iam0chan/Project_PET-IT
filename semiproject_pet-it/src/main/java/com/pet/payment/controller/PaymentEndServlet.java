package com.pet.payment.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;
import com.pet.payment.service.PaymentService;

/**
 * Servlet implementation class PaymentEndServlet
 */
@WebServlet("/paymentEnd.do")
public class PaymentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Payment payment = (Payment) session.getAttribute("payment");
		OrderDetail od = (OrderDetail) session.getAttribute("orderDetail");
		List<OrderDetail>orderList = (List<OrderDetail>)session.getAttribute("orderList");
		
		boolean resultOl = new PaymentService().insertOrderDetail(orderList,od);
		if(resultOl) System.out.println("OderList 저장성공!");
		else System.out.println("OderList 저장실패ㅠㅠㅠㅠ");

		System.out.println("End서블릿 payment : "+ payment);
		System.out.println("End서블릿 orderlist : "+ orderList);
		
		request.setAttribute("payment", payment);
		request.setAttribute("orderList", orderList);
		request.getRequestDispatcher("/views/payment/orderPayComplete.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
