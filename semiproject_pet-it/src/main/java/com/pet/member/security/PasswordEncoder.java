package com.pet.member.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncoder extends HttpServletRequestWrapper{

	public PasswordEncoder(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
			if(name.equals("memberPw")) {
				String ori = super.getParameter(name);
				/* System.out.println("password 원본 : "+ori); */
				String change=getSHA512(ori);
				/* System.out.println("password 변경 : "+change); */
				return change;
			}
				return super.getParameter(name);
	}
	
	private String getSHA512(String oriVal) {
		//java.security.MessageDigest클래스
		MessageDigest md=null;
		
		try {
			md = MessageDigest.getInstance("SHA-512");                  
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] oridatabyte=oriVal.getBytes();
		md.update(oridatabyte);//sha-512방식으로 암호화처리
		byte[] encryptData=md.digest();
		//문자열 변환을 하기위해 Base64클래스가 제공하는 인코더 사용
		String encryptStr = Base64.getEncoder().encodeToString(encryptData);
		
		return encryptStr;
	}
}



















