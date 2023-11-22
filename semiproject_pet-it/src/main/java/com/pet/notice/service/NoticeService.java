package com.pet.notice.service;

import static com.pet.common.JDBCTemplate.close;

import static com.pet.common.JDBCTemplate.getConnection;

import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.notice.model.dao.NoticeDao;
import com.pet.notice.model.dto.Notice;

public class NoticeService {

	private NoticeDao dao = new NoticeDao();

	public List<Notice> selectNotice(int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Notice> result = dao.selectNotice(conn, cPage, numPerpage);
		close(conn);
		return result;
	}

	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}

	public Notice selectNoticeByNo(String noticeNo, boolean readResult) {
		Connection conn = getConnection();
		Notice n = dao.selectNoticeByNo(conn, noticeNo);
		if (n != null && !readResult) {
			int result = dao.updateNoticeReadCount(conn, noticeNo); // 조회수
			if (result > 0) {
				commit(conn);
				n.setNoticeHits(n.getNoticeHits() + 1);
			} else
				rollback(conn);
		}
		close(conn);
		return n;

	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = dao.insertNotice(conn, n);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int selectNoticeCountByCategory(String category) {
		Connection conn = getConnection();
		int result = dao.selectNoticeCountByCategory(conn, category);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public List<Notice> selectNoticeCategory(int cPage, int numPerpage, String category) {
		Connection conn = getConnection();
		List<Notice> result = dao.selectNoticeCategory(conn, cPage, numPerpage, category);
		close(conn);
		return result;
	}
	
	//검색창 
	public List<Notice> searchNotice(int cPage, int numPerpage, String key, String keyword){
		Connection conn = getConnection();
		List<Notice> resultList = null;
		if(key.equals("notice_title")) {
			resultList = dao.noticeSearchTitle(conn, cPage, numPerpage, keyword);
		}else {
			resultList = dao.noticeSearchContent(conn, cPage, numPerpage, keyword);
		}
		close(conn);
		return resultList;
	}

}
