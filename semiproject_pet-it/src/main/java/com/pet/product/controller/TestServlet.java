package com.pet.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ori ="";
		Gson gson = new Gson();
		Map<String,Object> map = new HashMap<>();
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("안돼!");
		}else {
			String path = getServletContext().getRealPath("/upload/");
			MultipartRequest mr = new MultipartRequest(request,path,1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
			System.out.println(path);
			Enumeration<String> names = mr.getFileNames();
			List<Map<String,String>> files=new ArrayList<>();
			while(names.hasMoreElements()) {
				String name = names.nextElement();
				System.out.println(name);
				String re = mr.getFilesystemName(name);
				ori = mr.getOriginalFileName(name)+"||";
				files.add(Map.of("rename",re,"oriName",ori));
			}
			files.forEach(e->{System.out.println(e);});
			/*
			 * request.getRequestDispatcher("/product/productFileUploadEnd.do").forward(
			 * request, response);
			 */
		response.setHeader("Content-Type", "application/json");
		PrintWriter out = response.getWriter();
        map.put("uploaded", true);
        gson.toJson(map);
        out.print(map);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
