<%@page import="javax.print.attribute.HashPrintRequestAttributeSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.pet.notice.model.dto.Notice" %>	
<%
	List<Notice> notices=(List<Notice>)request.getAttribute("notices");
%>

<%@ include file="/views/header.jsp"%>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>공지사항 메인화면</title>



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

.boardsearchAll{
	text-align: center;
}

.pageingBar{
	text-align: center;
}

#searchMenu {
	text-align: center;
	height : 25px;
}

#selectSearch{
	text-align: center;
	height : 25px;
}

table#tbl-notice td,table#tbl-notice th{
	line-height:35px !important;
}

tr.item {
  color: #000; /* 텍스트 색상 */
  background-color: #fff; /* 기본 배경 색상 */
}

tr.item:hover {
  color: #000; /* 마우스를 올렸을 때 텍스트 색상 */
  background-color: #04aa6d; 
}

.pageBar {
	text-align: center;
}
.Pet-it-adminBtn{
	text-align: center;
	height: 25px;
	line-height : 20px;
}



</style>

</head>
<body>
	<div class="space">
		<div class="titleArea">
			<h2>공지사항</h2>
			<p>Pet-it에서 안내드립니다.</p>
		</div>
	</div>
	<div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> 
			<select id="selectCategory" name="selectCategory">
					<option value="전체"<%=request.getParameter("notices")!=null&&request.getParameter("notices").equals("전체")?"selected":"" %>>전체</option>
					<option value="공지사항" <%=request.getParameter("notices")!=null&&request.getParameter("notices").equals("공지사항")?"selected":"" %>>공지사항</option>
					<option value="이용안내" <%=request.getParameter("notices")!=null&&request.getParameter("notices").equals("이용안내")?"selected":"" %>>이용안내</option>
			</select>
			</span>
		</div>
				<table id="tbl-notice" class="table table-sm">
				<thead class="listHeard">
					<tr class="noticeTitle">
					<th scope="col" class="active text-center" style="width: 80px;">번호</th>
					<th scope="col" class="active text-center" style="width: 120px;">카테고리</th>
					<th scope="col" class="active text-center" style="width: 480px;">제목</th>
					<th scope="col" class="active text-center" style="width: 100px;">작성일</th>
					<th scope="col" class="active text-center" style="width: 80px;">조회수</th>
				
					</tr>
				</thead>
				
				<tbody class="text-center">
				<%
				if (notices!= null && !notices.isEmpty()) {
					for (Notice n : notices) {
				%>
				<tr class="item">
					<td><%=n.getNoticeNo() %></td>
					<td><%=n.getNoticeCategory() %></td>
					<td><a href="<%=request.getContextPath()%>/noticeView.do?no=<%=n.getNoticeNo()%>">
					<%=n.getNoticeTitle() %>
					</a></td>
					<td><%=n.getNoticeDate() %></td>
					<td><%=n.getNoticeHits() %></td>
				</tr>
				<%
				}
				}
				%>
				</tbody>

			</table>
		</div>


	<div class="pageBar">
		<div><%=request.getAttribute("pageBar") %></div>
	</div>
	
	<div class="boardsearchAll">
		<form action='<%=request.getContextPath()%>/noticeSearchMenu.do' method="get" >
			<select id="searchKey" name="searchKey">
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
			</select>
			
		<input type="search" id="searchMenu" name="searchKeyword" placeholder="입력하세요">
			<input type="submit" name="selectSearch" class="btn btn-outline-success" value="검색" style="line-height:1.0;">
		</form> 
	</div> 
	
	<div>
		<%if(loginMember!=null
			&&loginMember.getMemberId().equals("jihyes")){ %>
			 <div class="Pet-it-adminBtn">
			 	<button onclick="location.assign('<%=request.getContextPath()%>/noticewriter.do')" class="btn btn-outline-success">글쓰기</button>
			 </div>
			 
	</div>
	<%} %>
	
	<!--카테고리별 조회 script-->
	<script>
	const selectCategory = document.getElementById("selectCategory");
	console.log(selectCategory)
	selectCategory.addEventListener("change",function(e){
	location.replace("<%=request.getContextPath()%>/noticeinquiry.do?notices="+ e.target.value);
	});
	
	
	
	</script>


</body>
</html>
<%@ include file="/views/footer.jsp"%>