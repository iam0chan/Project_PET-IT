<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.pet.member.dto.Member,java.util.List,java.util.Arrays"%>
<%@ include file="/views/header.jsp"%>

<%
    Member m = (Member) request.getAttribute("member");
%>

<section id="enroll-container">
    <h3>회원 정보 수정</h3>
    <form id="memberFrm" method="post" action="<%= request.getContextPath() %>/enrollUpdate.do">
        <hr />
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="memberId" id="memberId_" value="<%=m.getMemberId()%>" readonly></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="memberName" id="memberName_" value="<%=m.getMemberName()%>" required><br></td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="email" placeholder="abc@xyz.com" value="<%=m.getMemberEmail()%>" name="memberEmail" id="memberEmail_"><br></td>
            </tr>
            <tr>
                <th>휴대폰</th>
                <td><input type="tel" placeholder="(-없이)01012345678" value="<%=m.getMemberPhone()%>" name="memberPhone" id="memberPhone_" maxlength="11"><br></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" placeholder="" value="<%=m.getMemberAddress()%>" name="memberAddress" id="memberAddress_"><br></td>
            </tr>
        </table>
        <input type="submit" value="정보수정" />
    </form>
</section>
</body>
</html>

<%@ include file="/views/footer.jsp"%>
