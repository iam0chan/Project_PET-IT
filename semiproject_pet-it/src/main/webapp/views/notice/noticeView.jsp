<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 50%;
}

.row {
	width: 800px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.space {
	width: 900px;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	margin: 0px auto;
}
}
</style>
<div class="space">
	<div class="titleArea">
		<h2>공지사항</h2>
	</div>
	<div id="list-btn" class="btn-container" style="width: 107px;">

		<button id="list-btn" class="btn btn-outline-success ">수정</button>
	</div>
	<div class="container mt-3">
		<div class="row">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="text-align: center; background-color: #F2F2F2;">제목</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center; background-color: #F2F2F2;">작성일</td>
						<td>2023-11-18</td>
					</tr>
				</tbody>
			</table>

			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="text-align: center; background-color: #F2F2F2;">내용</th>

					</tr>
				</thead>
				<tbody>
					<tr>
						<td>good</td>
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
	
	const listBtn = ()=> {
		alert("발생");
		location.replace("<%=request.getContextPath()%>/noticeList.do");
	}
</script>
<%@ include file="/views/footer.jsp"%>