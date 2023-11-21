<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.pet.question.model.dto.Question"%>
<%
List<Question> question = (List<Question>) request.getAttribute("question");
%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question 메인화면</title>

<style>
.titleArea {
	padding-top: 80px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

#content-container {
	margin: 0 auto;
}

.boardTable {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

.boardSort {
	align-items: left;
}

.boardsearchAll {
	text-align: center;
}

.pageingBar {
	text-align: center;
}

#search {
	text-align: center;
	height: 25px;
}

#writeBtn {
	float: right;
}

table#tbl-question td, table#tbl-question th {
	line-height: 35px !important;
}

tr.item {
	color: #000;
	background-color: #fff;
}

tr.item:hover {
	color: #000;
	background-color: #04aa6d;
}

#pageBar {
	text-align: center;
}

.questionwriter {
	text-align: center;
	height: 25px;
	line-height: 20px;
}
</style>
</head>
<body>
	<div class="space">
		<div class="titleArea">
			<h2>1:1문의</h2>
			<p>문의내용을 남겨주시면 빠른 시간 내 답변을 드리겠습니다.</p>
		</div>
	</div>

	<div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> <select id="selectCategory"
				name="selectCategory">
					<option value="전체"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("전체") ? "selected" : ""%>>전체</option>
					<option value="회원서비스"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("회원서비스") ? "selected" : ""%>>회원서비스</option>
					<option value="제품문의"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("제품문의") ? "selected" : ""%>>제품문의</option>
					<option value="주문/결제"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("주문/결제") ? "selected" : ""%>>주문/결제</option>
					<option value="배송"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("배송") ? "selected" : ""%>>배송</option>
					<option value="취소/반품/교환"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("취소/반품/교환") ? "selected" : ""%>>취소/반품/교환</option>
					<option value="제품/서비스 이용불만"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("제품/서비스 이용불만") ? "selected" : ""%>>제품/서비스이용불만</option>
					<option value="기타"
						<%=request.getParameter("question") != null && request.getParameter("question").equals("기타") ? "selected" : ""%>>기타</option>
			</select>
			</span>
		</div>
		<table id="tbl-question" class="table table-sm">
			<thead class="listHeard">
				<tr class="questionTitle">
					<th scope="col" class="active text-center" style="width: 80px;">번호</th>
					<th scope="col" class="active text-center" style="width: 180px;">카테고리</th>
					<th scope="col" class="active text-center" style="width: 400px;">제목</th>
					<th scope="col" class="active text-center" style="width: 100px;">작성일</th>

				</tr>
			</thead>
			<tbody class="text-center">
				<%
				if (question!= null && !question.isEmpty()) {
					for (Question q : question) {
				%>
				<tr class="item">
					<td><%=q.getQuestionNo()%></td>
					<td><%=q.getQuestionCategory()%></td>
					<td>
						<a href="<%=request.getContextPath()%>/questionView.do?no=<%=q.getQuestionNo()%>">
						<%=q.getQuestionTitle() %>
						</a>
					</td>
					<td><%=q.getQuestionDate() %></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
	  <div>
		<%
		if (loginMember != null ) {
		%> 
		<div class="questionwriter">
			<button
				onclick="location.assign('<%=request.getContextPath()%>/questionwriter.do')"
				class="btn btn-outline-success">글쓰기</button>
		</div>
	 </div>
	<%
	}
	%>  

	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
	<div class="boardsearchAll">
		<fieldset class="boardSearch">
			<p>
				<select id="searchKey" name="searchKey">
					<option value="subject">제목</option>
					<option value="subject">내용</option>
				</select> <input id="search" name="search" placeholder="입력하세요">
				<button class="btn btn-primary btn-sm">
					<a href="#none">SEARCH</a>
				</button>
			</p>
		</fieldset>
	</div>

	<script>
	const selectCategory = document.getElementById("selectCategory");
	console.log(selectCategory)
	selectCategory.addEventListener("change",function(e){
	location.replace("<%=request.getContextPath()%>/questioninquiry.do?question="+ e.target.value);
	});
	
	
	
	</script>



</body>
</html>

<%@ include file="/views/footer.jsp"%>
