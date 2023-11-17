<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 관리자 작성페이지</title>
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

.notice-content {
	display: flex;
	justify-content: center;
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
				<h2>공지사항 작성</h2>
			</div>
			<div class="container mt-3">
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">

						<form action="<%=request.getContextPath()%>/noticeEnrollEnd.do"
							method="post" enctype="multipart/form-data">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center; background-color: #F2F2F2;">제목</th>
										<th><select id="selectCategory" name="selectCategory">
												<option value selected="selected">전체</option>
												<option value="공지사항">공지사항</option>
												<option value="이용안내">이용안내</option>
										</select> <input id="notice-title" style="width: 400px;" type="text">
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td style="text-align: center; background-color: #F2F2F2;">작성자</td>
										<td>Pet-it</td>
									</tr>

								</tbody>
							</table>
					</div>
					<div class="col-lg-2"></div>
				</div>
				<div id="editor"></div>
				<br>
				</form>
			</div>

			<div class="container mt-3">
				<div class="row">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<form action="#">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th
											style="text-align: center; width: 80px; background-color: #F2F2F2;">첨부파일</th>
										<th><input class="fileBtn" type="file" name="file"
										 value="첨부파일" /></th>
									</tr>
								</thead>
							</table>
						</form>
						
						<div id="submitBtn" class="row">
	                	<div class="col-5"></div>
	                	<div class="col-1">
	                		<input class="submit-Btn" type="submit"  value="작성완료" />
	                	</div>
	     
	                    <div class="col-1">
	                    	<input class="Btn" type="reset"  value="작성취소" />
	                    </div>
	                    <div class="col-5"></div>
		            </div>








	<script>
	<%-- $(".submit-Btn").click(function(){
		const formdata = new formData();
		formdata.append($(".fileBtn").val());
		$.ajax{
			url:"<%=request.getContextPath()%>/notice/test.do",
			type:"post",
			enctype:"multipart/form-data",
			processData:false,
			contentType:false,
			success:function(data){
				
			},
			error:function(e){
				alert("ajax이미지 업로드 실패");
			}
		}
	}); --%>
	
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
	    /* console.log(editorData); */
	    $("#upload").attr("value",editorData);
	    console.log($("#upload").val());
	}
	
	</script>
</body>
</html>

<%@ include file="/views/footer.jsp"%>