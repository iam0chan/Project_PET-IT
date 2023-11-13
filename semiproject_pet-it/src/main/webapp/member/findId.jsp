<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../views/header.jsp" %>
<style>
	body {
        box-sizing: border-box;
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
</style>
<section>
<table style=>
	<tr style="border:1px solid;">
		<th><a href="">아이디 찾기</a></th>
		<th><a href="">비밀번호 찾기</a></th>
	</tr>
	<tr>
		<td><input type="checkbox">이메일로 찾기</td>
	</tr>
	<tr>
		<td><input type="text" placeholder="이름"></td>
	</tr>
	<tr>
		<td><input type="text" placeholder="이메일"></td>
	</tr>
	<tr>
		<td>정보 보호를 위해 아래 자동입력 방지 문자를 입력해주세요.</td>
	</tr>
	<tr>
		<td style="height:150px; border:1px solid">(자동입력방지문구)</td>
	</tr>
	<tr>
		<td><input type="text" placeholder="위에 보이는 문자를 입력해주세요."></td>
	</tr>
	<tr>
		<td><input type="button" value="인증번호 받기"></td>
	</tr>	
</table>
</section>
<%@ include file ="../views/footer.jsp" %>