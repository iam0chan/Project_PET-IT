package com.pet.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;

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
		
		HttpSession session = request.getSession(false);
		Payment payment = (Payment) session.getAttribute("payment");
		OrderDetail od = (OrderDetail) session.getAttribute("orderDetail");
		
		System.out.println("End서블릿 payment : "+ payment);
		System.out.println("End서블릿 orderDetail : "+ od);
		
		request.setAttribute("payment", payment);
		request.setAttribute("orderDetail", od);
		request.getRequestDispatcher("/views/payment/orderPayComplete.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
