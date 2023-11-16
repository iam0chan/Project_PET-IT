package com.pet.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.service.ProductService;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/productview.do")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		System.out.println(productNo);
		Product product = new ProductService().selectProductByNo(productNo);
		ProductImageFile file = new ProductService().selectMainImageFile(product.getProductNo());
		System.out.println(file.toString());
		if(product!=null && file!=null) {
			request.setAttribute("product", product);
			request.setAttribute("file", file);
			if(product.getProductDiscount()!=null) {
				int discountPrice = (int)(product.getProductPrice()-(product.getProductPrice()*Double.parseDouble(product.getProductDiscount())));
				request.setAttribute("discountPrice", discountPrice);
			}
		}else {
			System.out.println("조회실패!!");
		}
		request.getRequestDispatcher("/views/product/productView.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
