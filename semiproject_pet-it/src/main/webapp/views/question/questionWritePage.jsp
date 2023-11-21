<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>question 고객 작성페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

<style>
* {
	letter-spacing: -.5px;
	font-weight: 300;
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

.ck.ck-editor {
	width: 100%;
	max-width: 850px;
	margin: 0 auto;
}

.ck-editor__editable {
	height: 50vh;
}

#submitBtn {
	text-align: center;
}
</style>

</head>
<body>
	<section class="container mt-3">
		<div class="space">
			<div class="titleArea">
				<h2>1:1문의</h2>
			</div>
			<div class="container mt-3">
				<form id="questionform"
					action="<%=request.getContextPath()%>/questionwriterpage.do"
					method="post">
					<div class="row">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center; background-color: #F2F2F2;">제목</th>
										<th><select id="selectCategory" name="selectCategory">
												<option value="회원서비스">회원서비스</option>
												<option value="제품문의">제품문의</option>
												<option value="주문/결제">주문/결제</option>
												<option value="배송">배송</option>
												<option value="취소/반품/교환">취소/반품/교환</option>
												<option value="제품/서비스 이용 불만">제품/서비스 이용 불만</option>
												<option value="기타">기타</option>
										</select> <input id="question-title" style="width: 400px;" type="text" name="title">
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center; background-color: #F2F2F2;">작성자</td>
										<td><input type="text" name="loginMember" value="<%=loginMember.getMemberId()%>"></td>
										<!--아이디값 자동부여  -->
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-lg-2"></div>
					</div>
					<div id="editor"></div>
					<br>
					<div id="submitBtn" class="row">
						<div class="col-5"></div>
						<div class="col-1">
							<input type="hidden" id="content" name="content" value="">
							<input class="btn btn-outline-success" onclick="test();"
								type="submit" value="write" />
						</div>
						<div class="col-1">
							<button class="btn btn-outline-success" type="reset"
								id="resetBtn">cancell</button>
						</div>
					</div>
					
				</form>
			</div>

	<script>
 	
	$("#resetBtn").on("click",function(){
		location.href="<%=request.getContextPath()%>/views/question/questionList.jsp";
	})
	
	var editor;
	ClassicEditor
	.create(document.querySelector('#editor'), {
		ckfinder: {
			uploadUrl : '<%=request.getContextPath()%>/image/upload'
		}
	})
	.then(e => {
		editor = e;
		console.log('Editor was initialized');
	})
	.catch(error => {
		console.error(error);
	});
	
	function test(){    
        const editorData = editor.getData();
        $("#content").attr("value", editorData);
        console.log($("#content").val());
        $("#questionform").submit();
    }
	
	</script>
</body>
</html>



<%@ include file="/views/footer.jsp"%>