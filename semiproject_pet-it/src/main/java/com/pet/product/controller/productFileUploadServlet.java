package com.pet.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/product/productFileUpload.do")
public class productFileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Part filePart = request.getPart("upload");
        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String ext = originalFileName.substring(originalFileName.indexOf("."));
        String newFileName = UUID.randomUUID().toString() + ext;

        String realPath = request.getServletContext().getRealPath("/");
        String savePath = realPath + "upload/" + newFileName;
        String uploadPath = "./upload/" + newFileName;

        File fileSaveDir = new File(realPath + "upload/");
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        File file = new File(savePath);
        filePart.write(savePath);

        PrintWriter out = response.getWriter();
        out.print("{");
        out.print("\"uploaded\": true,");
        out.print("\"url\": \"" + uploadPath + "\"");
        out.println("}");
			
			
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
