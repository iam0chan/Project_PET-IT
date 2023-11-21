package com.pet.question.model.dto;

import java.sql.Date;
import lombok.Builder;
import lombok.Data;
@Data
@Builder

public class Question {

	private String questionNo;
	private String memberId;
	private Date questionDate;
	private String questionTitle;
	private String questionCategory;
	private String questionContent;
}
