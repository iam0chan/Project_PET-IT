<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.pet.question.model.dto.Question" %>	
<%
	Question q = (Question) request.getAttribute("question");
%>
<%@ include file="/views/header.jsp"%>

<style>
* {
	letter-spacing: -.5px;
	font-weight: 300;
	line-height: 1.0;
}

.titleArea {
	padding-top: 80px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.container mt-3 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	width: 1000px !important;
	padding: 0px !important;
}

.row {
	width: 900px;
/* 	margin: 0 auto; */
	display: flex{0,1,0};
	flex-direction: column;
	align-items: center;
}

.space {
	width: 900px;
	display: flex;
	flex-direction: column;
/* 	align-items: center; */
	margin: 0px auto;
}

#contentBox{
	width: 900px !important;
}

#contentBox img {
	width: 800px !important;
	height : 800px !important;
}

</style>
<div class="space">
	<div class="titleArea">
		<h2>1:1문의</h2>
	</div>

	<div id="list-btn" class="btn-container" style="width: 107px;" >
		<%if(loginMember!=null
			&&loginMember.getMemberId().equals("jihyes")){ %>
			 <div class="Pet-it-adminBtn">
			 <button onclick="location.assign('<%=request.getContextPath()%>/questionwriter.do')" class="btn btn-outline-success">수정</button>
			 </div>
	</div>
	<%} %>
	
	<div class="container mt-3">
		<div class="row">
			<table class="table table-bordered">
					<tr>
						<th style="text-align: center; background-color: #F2F2F2;">제목</th>
						<th><%=q.getQuestionTitle()%></th>
					</tr>
					<tr>
						<td style="text-align: center; background-color: #F2F2F2;">작성일</td>
						<td><%=q.getQuestionDate()%></td>
					</tr>
			</table>
			<table class="table table-bordered" style="text-align:center;">
				<thead>
					<tr>
						<th style="text-align: center; background-color: #F2F2F2;">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="contentBox"><%=q.getQuestionContent()%></td>
					</tr>
				</tbody>
			</table>
			<div class="btn-container">
				<button id="list-btn" class="btn btn-outline-success" onclick="listBtn();">목록</button>
			</div>
		</div>
	</div>

</div>

<script>
	//목록버튼 눌렀을 때 questionList로 페이지이동 
	const listBtn = ()=> {
		location.replace("<%=request.getContextPath()%>/questionList.do");
	}
	
	
</script>
<%@ include file="/views/footer.jsp"%>