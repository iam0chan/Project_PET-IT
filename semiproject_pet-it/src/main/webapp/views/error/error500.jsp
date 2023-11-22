<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.error500-img-container{
		margin: 0px auto;
		text-align:center;
	}
	.error-container{
		display:flex;
		flex-direction:column;
		align-items:center;
	}
</style>
</head>
<body>
<div class="error-container">
<div class="error-title">
<h1 style="color:red">Internet Server Error</h1>
</div>
	<div class="error500-img-container">
		<img src="<%=request.getContextPath()%>/upload/error/error-500.jpeg" alt="에러화면" width="1200px" height="450px">
		<h3>죄송합니다. 관리자에게 문의해주시면 빠른 처리 하겠습니다.</h3>
	</div>
</div>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000)
		
	</script>
</body>
</html>