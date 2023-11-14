package com.pet.faq.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.pet.faq.model.dao.FaqDao;
import com.pet.faq.model.dto.Faq;

public class FaqService {
	
		private FaqDao dao = new FaqDao(); 
		
		public List<Faq> selectFaq(int cPage,int numPerpage){
			Connection conn=getConnection();
			List<Faq> result=dao.selectFaq(conn, cPage, numPerpage);
			 //BoardDao의 selectBoard 메서드를 호출하여 게시물 목록을 가져옴
			close(conn);
			return result;
		}
		public int selectFaqCount() {
			Connection conn=getConnection();
			int result=dao.selectFaqCount(conn);
			close(conn);
			return result;
		}
		
	
}
