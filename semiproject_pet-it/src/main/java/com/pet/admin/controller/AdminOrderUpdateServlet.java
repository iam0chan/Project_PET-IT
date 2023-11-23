package com.pet.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.admin.service.AdminService;
import com.pet.payment.model.dto.Order;
import com.pet.payment.model.dto.OrderDetail;
import com.pet.payment.model.dto.Payment;

/**
 * Servlet implementation class AdminOrderUpdateServlet
 */
@WebServlet("/adminOrderUpdate.do")
public class AdminOrderUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long orderNo = Long.parseLong(request.getParameter("orderNo"));
		String orderName = request.getParameter("orderName");
		String orderZipcode = request.getParameter("orderZipcode");
		String orderAddr = request.getParameter("orderAddr");
		String orderDefAddr = request.getParameter("orderDefAddr");
		String orderPhone = request.getParameter("orderPhone");
		String orderEmail = request.getParameter("orderEmail");
		String deliveryReq = request.getParameter("deliveryReq");
		
		Order o = Order.builder()
				.orderNo(orderNo)
				.orderName(orderName)
				.orderZipcode(orderZipcode)
				.orderAddr(orderAddr)
				.orderDefAddr(orderDefAddr)
				.orderPhone(orderPhone)
				.orderEmail(orderEmail)
				.deliveryReq(deliveryReq)
				.build();
		
		int result = new AdminService().updateOrder(o);
		
		List<OrderDetail> odl = new AdminService().selectOrderDetailByNo(orderNo);
		List<Payment> pl = new AdminService().selectPaymentByNo(orderNo);
		List<Order> ol = new AdminService().selectOrderByNo(orderNo);
		
		System.out.println(odl);
		System.out.println(pl);
		System.out.println(ol);
		
		request.setAttribute("odl", odl);
		request.setAttribute("pl", pl);
		request.setAttribute("ol", ol);
		
		request.getRequestDispatcher("/views/admin/adminOrderView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
