package com.pet.admin.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pet.admin.service.AdminService;

/**
 * Servlet implementation class AdminOrderDelete
 */
@WebServlet("/adminOrderDelete")
public class AdminOrderDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oa = request.getParameter("arrOrderNo"); // JSON 문자열을 가져옴
	    Gson gson = new Gson();
	    String[] oArr = gson.fromJson(oa, String[].class); // JSON 문자열을 배열로 변환
	    long[] orderArr = new long[oArr.length];

	    for(int i = 0; i < oArr.length; i++) {
	    	orderArr[i] = Long.parseLong(oArr[i]);
	    }
	    System.out.println(Arrays.toString(orderArr));
	    
	    boolean result = new AdminService().deleteOrderList(orderArr);
	    if(result) System.out.println("DB삭제 성공!");
	    response.setStatus(HttpServletResponse.SC_OK);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
