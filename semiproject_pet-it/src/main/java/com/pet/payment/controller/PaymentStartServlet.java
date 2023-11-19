package com.pet.payment.controller;

import java.io.IOException;

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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentStartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//productView에서 넘어온 데이터에서 orderPay로 넘겨줄 정보 꺼내기
		String productNo = request.getParameter("productNo");
		
		//productNo 먼저 가져와서 해당 상품 단가, 파일이미지 가져오기
		Product p = new ProductService().selectProductByNo(productNo);
		ProductImageFile img = new ProductService().selectMainImageFile(productNo);
		int detailPrice = p.getProductPrice();
		String productImg = img.getProductFileRename();
		String productName = p.getProductName();
		String optionName = request.getParameter("optionName");
		System.out.println("start서블릿: "+p);
		//상품 갯수 가져오기
		int detailCount = Integer.parseInt(request.getParameter("orderAmount"));
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
