package com.pet.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.payment.model.dto.OrderDetail;
import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.service.ProductService;

/**
 * Servlet implementation class PaymentStartServlet
 */
@WebServlet("/paymentStart.do")
public class PaymentStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PaymentStartServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		/* 장바구니에서 다수 상품으로 넘어올 때 */
//		String [] cartList = request.getParameterValues("cartList");
//		List<OrderDetail> odl = new ArrayList<OrderDetail>();
//		
//		if(cartList!=null) {
//			for(String value : cartList) {
//				OrderDetail od = new OrderDetail(value);
//			}
//		}
//		
		/* 상품페이지에서 단일 상품으로 넘어올 때 */
		// 상품페이지에서 넘어온 상품 번호, 옵션명, 상품 갯수 가져오기
		String productNo = request.getParameter("productNo");
		String optionName = request.getParameter("optionName");
		int detailCount = Integer.parseInt(request.getParameter("orderAmount"));
		
		// 가져온 상품번호 으로 상품 객체, 상품이미지 객체 가져오기
		Product p = new ProductService().selectProductByNo(productNo);
		ProductImageFile img = new ProductService().selectMainImageFile(productNo);
		
		// 상품객체에서 상품 단가, 상품명 가져오기
		int detailPrice = p.getProductPrice();
		String productName = p.getProductName();
		
		// 상품이미지객체에서 이미지 파일명 가져오기
		String productImg = img.getProductFileRename();
		
		System.out.println("start서블릿: "+p);
		
		//가져온 정보들 od객체에 저장해서 넘겨주기
		OrderDetail od = OrderDetail.builder()
				.productNo(productNo)
				.detailPrice(detailPrice)
				.detailCount(detailCount)
				.productImg(productImg)
				.productName(productName)
				.productOption(optionName)
				.build();
		
		request.setAttribute("orderDetail", od);
		request.getRequestDispatcher("/views/payment/orderPay.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
