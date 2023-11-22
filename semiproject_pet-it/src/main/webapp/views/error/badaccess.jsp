<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:red"><%=exception.getMessage() %></h1>
	<img src="<%=request.getContextPath()%>/upload/error/error.webp" alt="에러화면" width="100%",height="500">
	<h3>3초 후에 메인화면으로 이동합니다. :p</h3>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000)
		
	</script>
</body>
</html>