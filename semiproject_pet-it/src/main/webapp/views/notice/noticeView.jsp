<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.pet.notice.model.dto.Notice" %>	
<%
	Notice n = (Notice) request.getAttribute("notice");
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
	display: flex;
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
}


</style>
<div class="space">
	<div class="titleArea">
		<h2>공지사항</h2>
	</div>
	
	<div id="list-btn" class="btn-container" style="width: 107px;" >
		<%if(loginMember!=null
			&&loginMember.getMemberId().equals("jihyes")){ %>
			 <div class="Pet-it-adminBtn">
			 <button onclick="location.assign('<%=request.getContextPath()%>/noticewriter.do')" class="btn btn-outline-success">수정</button>
			 </div>
	</div>
	<%} %>
	
	<div class="container mt-3">
		<div class="row">
			<table class="table table-bordered">
					<tr>
						<th style="text-align: center; background-color: #F2F2F2;">제목</th>
						<th><%=n.getNoticeTitle()%></th>
					</tr>
					<tr>
						<td style="text-align: center; background-color: #F2F2F2;">작성일</td>
						<td><%=n.getNoticeDate()%></td>
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
						<td><%=n.getNoticeContent()%></td>
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
	//목록버튼 눌렀을 때 noticeList로 페이지이동 
	const listBtn = ()=> {
		location.replace("<%=request.getContextPath()%>/noticeList.do");
	}
	
	
</script>
<%@ include file="/views/footer.jsp"%>