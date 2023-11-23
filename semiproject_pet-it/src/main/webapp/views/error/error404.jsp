<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ include file="/views/header.jsp" %>
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

<div class="error-container">
<div class="error-title">
<h1 style="color:red">요청한 페이지를 찾을 수 없습니다.</h1>
</div>
	<div class="error500-img-container">
		<img src="<%=request.getContextPath()%>/upload/error/error-404.jpeg" alt="에러화면" width="1200px" height="450px">
		<h3>3초후 메인페이지로 이동합니다.</h3>
	</div>
</div>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000)
		
	</script>
<%@ include file="/views/footer.jsp" %>