<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
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

#writeBtn{
	
	float : right;
}

table#tbl-question td,table#tbl-question th{
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



</style>
</head>
<body>
	<!-- 전체화면 div -->
	<div class="space">
		<!-- 1대1문의 header div -->
		<div class="titleArea">
			<h2>1:1문의</h2>
			<p>문의내용을 남겨주시면 빠른 시간 내 답변을 드리겠습니다.</p>
		</div>
	</div>

	<div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> <!-- 카테고리 선택 메뉴바 --> <select
				id="selectCategory" name="selectCategory">
					<option value selected="selected">전체</option>
					<option value="1">회원서비스</option>
					<option value="2">제품문의</option>
					<option value="3">주문/결제</option>
					<option value="4">배송</option>
					<option value="5">취소/반품/교환</option>
					<option value="6">제품/서비스 이용불만</option>
					<option value="7">기타</option>
			</select>
			</span>
		</div>
		<div class="boardTable">
			<table id="tbl-question" class="table table-sm">
				<colgroup>
					<col style="width: 50px";>
					<col style="width: 170px";>
					<col style="width: 300px";>
					<col style="width: 150px";>
					<col style="width: 150px";>
					<col style="width: 60px";>

				</colgroup>
				<thead calss="listHeard">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성일</th>
						<th scope="col">답변</th>
					</tr>
				</thead>
				<tbody>
					<tr class="item">
						<td>3</td>
						<td>배송</td>
						<td class=""><a href="" style="text-decoration:none; color:black;">배송질문 있습니다.</a></td>
						<td>이오공</td>
						<td>2023-11-11</td>
						<td>O</td>
					</tr>
					<tr class="item">
						<td>2</td>
						<td>제품/서비스이용불만</td>
						<td class=""><a href="" style="text-decoration:none; color:black;">북어트릿 맛없어요.</a></td>
						<td>이오공</td>
						<td>2023-10-11</td>
						<td>O</td>
					</tr>
					<tr class="item">
						<td>1</td>
						<td>제품문의</td>
						<td class=""><a href="" style="text-decoration:none; color:black;">북어트릿 주문확인 부탁드려요.</a></td>
						<td>이오공</td>
						<td>2023-10-08</td>
						<td>O</td>
					</tr>
				</tbody>
				
				
			</table>
		</div>
				<div id="writeBtn">
					<button class="btn btn-outline-success" onclick="#">
						<span class="customerBtn"> 글쓰기	</span>
					</button>
				</div>
	</div>
	<div class="pageingBar">
		<h2>페이징바 영역</h2>
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

</body>
</html>
<%@ include file="../views/footer.jsp"%>