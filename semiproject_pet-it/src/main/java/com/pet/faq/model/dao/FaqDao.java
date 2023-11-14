package com.pet.faq.model.dao;

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



public class FaqDao {

private Properties sql = new Properties();
	
	{
		String path=BoardDao.class
				.getResource("/sql/board/board_sql.properties").getPath();
		try(FileReader fr=new FileReader(path)) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Board> selectBoard(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> result = new ArrayList<>(); //반환값
		
		try {
			pstmt=conn.prepareCall(sql.getProperty("selectBoard")); //prepareCall : 저장된 프로시저 또는 쿼리를 실행할 준비
			pstmt.setInt(1, (cPage-1)*numPerpage+1); //페이지바 
			pstmt.setInt(2, cPage*numPerpage); //페이지바
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0; //변수가 항상 어떤 값을 가지고 있을 것이라는 것을 명시적으로 나타냄
					  //rs.next()가 아무런 결과를 반환하지 않을 때를 대비하여 초기값을 설정하여 변수가 항상 값을 가지도록 함
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectBoardCount"));
			 // Connection 객체를 사용하여 SQL 문장을 실행하기 위한 PreparedStatement 객체를 생성하고,
	        // "selectBoardCount"라는 프로퍼티(확장자가 .properties인 설정 파일에서 읽어온 값)로부터 SQL 쿼리를 가져와 설정
			rs=pstmt.executeQuery();
			// SQL 쿼리를 실행하고 결과를 ResultSet 객체에 저장
			if(rs.next()) result=rs.getInt(1);// ResultSet에서 첫 번째 열의 값을 가져와 result 변수에 저장
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
		

}
