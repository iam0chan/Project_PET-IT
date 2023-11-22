package com.pet.question.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class QuestionComment {

	private int replyNo;
	private String questionNo;
	private Date replyDate;
	private String replyContent;

}
