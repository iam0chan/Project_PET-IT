package com.pet.notice.model.dto;
import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Notice {
	private String noticeNo;
	private String noticeCategory;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeContent;
	private int noticeHits; //조회수 
	//파일 테이블에 선언할것
	private String noticeFileOriName;
	private String noticeFileReName;
	
	

}
