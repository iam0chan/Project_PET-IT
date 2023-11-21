package com.pet.notice.model.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.pet.faq.model.dao.FaqDao;
import com.pet.notice.model.dto.Notice;

public class NoticeDao {

		private Properties sql = new Properties();
		
		{
	        String path = FaqDao.class.getResource("/sql/notice/notice_sql.properties").getPath();
	        System.out.println(path);
	        try (FileReader fr = new FileReader(path)) {
	            sql.load(fr);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
				
		public List<Notice> selectNotice(Connection conn, int cPage, int numPerpage){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<Notice> result=new ArrayList<>();
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectNotice"));
				pstmt.setInt(1, (cPage-1)*numPerpage+1);
				pstmt.setInt(2, cPage*numPerpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					result.add(getNotice(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return result;
		}		
				
		public int insertNotice(Connection conn, Notice n) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(sql.getProperty("insertNotice"));
				pstmt.setString(1, n.getNoticeCategory());
				pstmt.setString(2, n.getNoticeTitle());
				pstmt.setString(3, n.getNoticeContent());
				result = pstmt.executeUpdate();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
		}
		
		public Notice selectNoticeByNo(Connection conn,String noticeNo) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Notice n=null;
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectNoticeByNo"));
				pstmt.setString(1, noticeNo);
				rs=pstmt.executeQuery();
				if(rs.next())n=getNotice(rs);
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return n;
			
		}
		
		public int selectNoticeCount(Connection conn) {
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectNoticeCount"));
				rs=pstmt.executeQuery();
				if(rs.next()) result=rs.getInt(1);
			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return result;
		}
		
		public int selectNoticeCountByCategory(Connection conn, String category) {
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        int result = 0;
	        try {
	            pstmt = conn.prepareStatement(sql.getProperty("selectNoticeCountByCategory"));
	            pstmt.setString(1, category);
	            rs = pstmt.executeQuery();
	            if (rs.next()) result = rs.getInt(1);
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return result;
	    }
	    
	    public List<Notice> selectNoticeCategory(Connection conn, int cPage, int numPerpage, String category){
	    	PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Notice> result = new ArrayList<>();

	        try {
	            pstmt = conn.prepareCall(sql.getProperty("selectNoticeCategory"));
	            pstmt.setString(1, category);
	            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
	            pstmt.setInt(3, cPage * numPerpage);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                result.add(getNotice(rs));
	            }
	        } catch (SQLException e) {
	            // 적절한 예외 처리를 추가할 수 있습니다.
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return result;
	    }
	    //검색창 참고해서 만들기
		
		
		//조회수 업데이트 메소드 
	    public int updateNoticeReadCount(Connection conn, String noticeNo) {
	    	PreparedStatement pstmt = null;
	    	int result=0;
	    	try {
	    		pstmt=conn.prepareStatement(sql.getProperty("updateNoticeReadcount"));
	    		pstmt.setString(1, noticeNo);
	    		result=pstmt.executeUpdate();
	    	}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
	    	
	    }
		
	    public List<Notice> noticeSearchTitle(Connection conn, int cPage, int numPerpage, String keyword){
	    	PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Notice> result = new ArrayList<>();

	        try {
	            pstmt = conn.prepareCall(sql.getProperty("noticeSearchTitle"));
	            pstmt.setString(1, keyword);
	            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
	            pstmt.setInt(3, cPage * numPerpage);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                result.add(getNotice(rs));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return result;
	    }
	    
	    public List<Notice> noticeSearchContent(Connection conn, int cPage, int numPerpage, String keyword){
	    	PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        List<Notice> result = new ArrayList<>();

	        try {
	            pstmt = conn.prepareCall(sql.getProperty("noticeSearchContent"));
	            pstmt.setString(1, keyword);
	            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
	            pstmt.setInt(3, cPage * numPerpage);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                result.add(getNotice(rs));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return result;
	    }
	   
	    
	    
	
		private Notice getNotice (ResultSet rs) throws SQLException{
			return Notice.builder()
					.noticeNo(rs.getString("NOTICE_NO"))
					.noticeCategory(rs.getString("NOTICE_CATEGORY"))
					.noticeTitle(rs.getString("NOTICE_TITLE"))
					.noticeDate(rs.getDate("NOTICE_DATE"))
					.noticeContent(rs.getString("NOTICE_CONTENT"))
					.noticeHits(rs.getInt("NOTICE_HITS"))
					.build();
			
			
		}
		
		
		
				
				
}
