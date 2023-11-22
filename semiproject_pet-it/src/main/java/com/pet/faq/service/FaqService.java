package com.pet.faq.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.pet.faq.model.dao.FaqDao;
import com.pet.faq.model.dto.Faq;
import com.pet.notice.model.dto.Notice;



public class FaqService {

		private FaqDao dao = new FaqDao(); 
		
		public List<Faq> selectFaq(int cPage,int numPerpage){
			Connection conn=getConnection();
			List<Faq> result=dao.selectFaq(conn, cPage, numPerpage);
			if(result!=null)commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		public int selectFaqCount() {
			Connection conn=getConnection();
			int result=dao.selectFaqCount(conn);
			if(result>0)commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		public int selectFaqCountByCategory(String category) {
			Connection conn=getConnection();
			int result=dao.selectFaqCountByCategory(conn, category);
			if(result>0)commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		
		//조회수증가 메소드 
		public Faq selectFaqByNo (String faqNo, boolean readResult) {
			Connection conn = getConnection();
			Faq f = dao.selectFaqByNo(conn, faqNo);
//				if(f!=null && !readResult) {
//					int result = dao.updateFaqReadCount(conn,faqNo);
//					if (result > 0) {
//						commit(conn);
//						f.setFaqHits(f.getFaqHits() + 1);
//					} else
//						rollback(conn);
//				}
				close(conn);
				return f;

			}
		
	
		public int insertFaq(Faq f) {
			Connection conn=getConnection();
			int result=dao.insertFaq(conn, f);
			if(result>0) commit(conn);
			else rollback(conn);
			close(conn);
			return result;
		}
		public List<Faq> selectFaqCategory(int cPage,int numPerpage, String category){
			Connection conn=getConnection();
			List<Faq> result=dao.selectFaqCategory(conn, cPage, numPerpage, category);
			close(conn);
			return result;
		}
		
		
		public List<Faq> searchFaqByMenu(String title, String content,
				int cPage,int numPerpage){
			Connection conn=getConnection();
			List<Faq> result=dao.searchFaqByMenu(conn,title,content,cPage,numPerpage);
			close(conn);
			return result;
			
		}
		//조회수
		public int updatefaqcnt(String faqno) {
			Connection conn=getConnection();			
			int result = dao.cntadd(conn,faqno);
			try {
				conn.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("service updatefaqcnt:"+result);
			close(conn);
			return result;
		}
		
		//검색기능 
		public List<Faq>selectFaq(int cPage, int numPerpage, String key, String keyword){
			Connection conn = getConnection();
			List<Faq> resultList = null;
			if(key.equals("faq_title")) {
				resultList = dao.faqSearchTitle(conn, cPage, numPerpage, keyword);
			}else {
				resultList = dao.faqSearchContenet(conn, cPage, numPerpage, keyword);
			}
			close(conn);
			return resultList;
					
		}
		
		
		

		
		
		
}

