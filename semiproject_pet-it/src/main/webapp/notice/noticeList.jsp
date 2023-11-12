<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

#search{
	text-align: center;
	height : 25px;
}



</style>

</head>
<body>
	<!-- 전체화면 div -->
	<div class="space">
		<!-- 공지사항 header div -->
		<div class="titleArea">
			<h2>공지사항</h2>
			<p>Pet-it에서 안내드립니다.</p>
		</div>
	</div>

	<div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> <!-- 카테고리 선택 메뉴바 --> <select
				id="selectCategory" name="selectCategory">
					<option value selected="selected">전체</option>
					<option value="1">공지사항</option>
					<option value="2">이용안내</option>
			</select>
			</span>

		</div>

		<div class="boardTable">

			<table border="0" class="table table-hover table-sm">
				<colgroup>
					<col style="width: 90px";>
					<col style="width: 150px";>
					<col style="width: 150px";>
					<col style="width: 150px";>
					<col style="width: 150px";>

				</colgroup>
				<thead calss="listHeard">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">카테고리</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td>공지사항</td>
						<td class=""><a href="">추석배송안내</a></td>
						<td>2023-11-11</td>
						<td>56</td>

					</tr>

					<tr>
						<td>9</td>
						<td>이용안내</td>
						<td class=""><a href="">추석배송안내</a></td>

						<td>2023-11-11</td>
						<td>74</td>

					</tr>
				</tbody>

			</table>
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
				</select> 
				<input id="search" name="search" 
					placeholder="입력하세요">
				<button class="btn btn-primary btn-sm">
					<a href="#none">SEARCH</a>
				</button>
			</p>
		</fieldset>
	</div> 




</body>
</html>
<%@ include file="../views/footer.jsp"%>