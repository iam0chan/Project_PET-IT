<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	
	body {
    box-sizing: border-box;
    line-height:40px;
    }
    
    .findPw{
    text-align:center;
  	width: 700px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
    height:500px;
    }
    .title{
    	display:flex;
    	justify-content:space-evenly;
		list-style-position: outside;
		padding:0;
		margin-bottom:50px;
    }
    .title>li{
    	display:flex;
    	justify-content:center;
    	list-style-type:none;
    }
    .title>li,.title>li>a{
    	width:100%; 	
   }
   .title>li:first-child>a{
   		border-right:1px solid lightgray;
   }
   .field input{
   		height:40px;
   }
</style>

<div class="findPw">
	<ul class="title">
		<li>
			<a href="<%=request.getContextPath()%>/find/id.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/find/pw.do">비밀번호 찾기</a>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/member/enrollMember.do" method="post" onsubmit="">								
			<div class="field">
				<span>
					<input type="text" placeholder="아이디를 입력해주세요" name="memberId" id="memberId_" >
				</span>
				<input type="submit" value="확인" style="height:40px" >
			</div>
			<br><br>
			<div style="display:">
			<div class="field">
				<b style="font-size: 14px">정보보호를위해 아래 자동입력방지 문자를 입력해주세요.</b>
			</div>
			<div>
				<input type="text" style="height:80px; border:1px solid" value="(자동입력방지문구)">
			</div>
		<input type="text" style="height:40px;" placeholder="위에 보이는 문자를 입력해주세요">
		<input type="submit" style="height:40px;" value="인증번호 받기" >
			</div>
	</form>
</div>
<%@ include file="/views/footer.jsp" %>