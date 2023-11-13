<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<style>
	body {
        box-sizing: border-box;
    }
    
    .enroll{
    width: 400px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    padding: 0 20px;
    margin-bottom: 20px;
}
	section {
        text-align:center;
        width: 350px;
	    max-width: 1000px;
	    height: 600px;
	    padding: 20px;
	    margin: 0px auto;
	    background: white;
    }
    .enroll .field{
    	margin: 5px 0;
    }
</style>
<div class="enroll">
<h2>회원가입</h2><br>
	<form action="<%=request.getContextPath()%>/member/enrollMember.do" method="post" onsubmit="">								
			<div class="field">	
				<b>아이디</b>
				<span>
					<input type="text" placeholder="아이디를 입력해주세요" name="userId" id="userId_" >
				</span>
			</div>
			<div class="field">
				<b>패스워드</b>
				<span>
					<input type="password" placeholder="비밀번호를 입력해주세요" name="password" id="password_" >
				</span>
			</div>
			<div class="field">
				<b>패스워드확인</b>
				<span>	
					<input type="password" placeholder="비밀번호를 한번 더 입력해주세요" id="password_2" >
				</span>
			</div>  
			<div class="field">
				<b>이름</b>
				<span>	
				<input type="text" placeholder="이름을 입력해주세요"  name="userName" id="userName" >
				</span>
			</div>
			<div class="field">
				<b>이메일</b>
				<span>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email">
				</span>
			</div>
			<div class="field">
				<b>주소</b>
				<span>	
					<input type="text" placeholder="주소를 입력해주세요" name="address" id="address">
				</span>
			</div>
	</form>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
</div>
<%@ include file="../views/footer.jsp" %>