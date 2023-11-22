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


@WebServlet("/adminOrderView.do")
public class AdminOrderViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AdminOrderViewServlet() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long orderNo = Long.parseLong(request.getParameter("orderNo"));
		System.out.println(orderNo);
		
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

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
