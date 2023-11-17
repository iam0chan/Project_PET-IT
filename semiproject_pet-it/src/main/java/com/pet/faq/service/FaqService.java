package com.pet.faq.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
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
		public Faq selectFaqByNo (int no) {
			Connection conn = getConnection();
			Faq f = dao.selectFaqByNo(conn, no);
				if(f!=null) {
					int result = dao.updateFaqReadCount(conn,no);
					if(result>0) commit(conn);
					else rollback(conn);
				}
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
		
		
		
		
		

		
		
		
}
