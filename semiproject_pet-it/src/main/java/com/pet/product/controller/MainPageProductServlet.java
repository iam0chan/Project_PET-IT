package com.pet.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.service.ProductService;

/**
 * Servlet implementation class MainPageProductServlet
 */
@WebServlet(urlPatterns={"/product/mainPage.do"})
public class MainPageProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		
		List<ProductImageFile> files = null;
		Map<String,ProductImageFile> data = new HashMap<>();
		List<Product> newProducts = new ProductService().selectProductListAll(1, 6, "new");
		for(Product p: newProducts) {
			data.put(p.getProductNo(),new ProductService().selectMainImageFile(p.getProductNo()));
			
		}
		
		request.setAttribute("newProducts", newProducts);
		request.setAttribute("imageData", data);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
