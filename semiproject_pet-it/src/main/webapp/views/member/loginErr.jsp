<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
	<script>
		alert("<%=msg%>");
		location.replace("<%=request.getContextPath()%><%=loc%>");
	</script>
</body>
</head>
</html>

<%@ include file="/views/footer.jsp"%>