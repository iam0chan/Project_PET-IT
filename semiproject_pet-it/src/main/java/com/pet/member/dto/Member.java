package com.pet.member.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberZipCode;
	private String memberAddr;
	private String memberDetailAddr;
	private Date memberDate;
	private String memberStatus;
	private String memberErmsid;
	private String memberAccept;
}
