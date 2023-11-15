<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/views/header.jsp" %>
<style>
	body {
    box-sizing: border-box;
    	}
    .findId{
    text-align:center;
  	width: 400px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
    height:650px;
    }
/*     .findId .title{
    	border:1px solid;
    } */
    .title{
    	display:flex;
    	justify-content:space-evenly;
		list-style-position: outside;
		padding:0;
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
</style>
<div class="findId">
	<ul class="title">
		<li>
			<a href="">아이디 찾기</a>
		</li>
		<li>
			<a href="">비밀번호 찾기</a	>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/member/enrollMember.do" method="post" onsubmit="">								
			<div class="field">	
				<span>
					<input type="text" placeholder="이름을 입력해주세요" name="memberName" id="memberName_" >
				</span>
			</div>
			<div class="field">
				<span>
					<input type="text" placeholder="이메일을 입력해주세요" name="memberId" id="memberId_" >
				</span>
			</div>
			<div class="field">
				<b style="font-size: 14px">정보보호를위해 아래 자동입력방지 문자를 입력해주세요</b>
			</div>  
			<div>
					<input type="text" style="height:150px; border:1px solid" value="(자동입력방지문구)">
			</div>
	</form>
		<input type="text" placeholder="위에 보이는 문자를 입력해주세요">
		<input type="submit" value="인증번호 받기" >
</div>
<%@ include file ="/views/footer.jsp" %>