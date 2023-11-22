<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콜센터 안내창</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<style>
	.content-box{
		margin:0px auto;
		display:flex;
		flex-direction:column;
		align-items:center;
		justify-content:center;
		/* border: 1px solid #28a745; */
		width:400px;
		height:320px;
	}
	.call-line{
		width: 200px;
    	border-top: 8px solid #04aa6d;
    	height: 40px;
	}
	
	.title{
		margin-top:30px;
		height:70px;
		margint-bottom:0px;
	}

	
	.table{
		border-spacing:10px 10px;
		border-collapse: separate;
		text-align:center;
		margin-top:15px;
		margin-bottom:30px;
		border-top:1px solid gray;
		border-bottom:1px solid gray;
	}
</style>
</head>
<body>
	<div class="content-box">
		<div class="title">
			<h1>콜 센터 안내공지</h1>
		</div>
		<div class="call-line"></div>
		<div class="content-box">
			<div class="content">
				<table class="table table-sm">
					<tr>
						<th rowspan='2'>운영시간:</th>
						<td colspan='2'>평일 09:00 ~ 17:50<td>
					</tr>
					<tr>
						<td colspan='2'>주말(토요일) 09:00 ~ 11:50</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<th>공지내용:</th>
						<td colspan='2'>상품문의 및 배송문의 등</td>
					<tr>
					</tr>
					<tr>
					<tr>
						<th>담당자:</th>
						<td>이지혜</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="close-btn">
			<button class="btn button-outline-success">닫기</button>
		</div>
	</div>
	
	<script>
		$(".btn").on("click",function(){
			window.close();
		})
		
	</script>
</body>
</html>