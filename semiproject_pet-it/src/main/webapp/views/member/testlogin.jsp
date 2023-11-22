<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
        font-family: 'Noto Sans KR', sans-serif;
        box-sizing: border-box;
    }

   body {
        line-height: 40px;
        margin: 0;
        padding: 0;
    }

    .enroll-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background: white;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .enroll-title {
        text-align: center;
        font-size: 26px;
        margin-bottom: 20px;
    }

    .enroll-line {
        text-align: right;
        font-size: 12px;
        border-bottom: 2px solid;
        width: 100%;
        margin-bottom: 20px;
    }

    /* 수정된 스타일 */
    .field {
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }

    .field b {
        margin-right: 10px;
    }

    .field input[type="text"],
    .field input[type="password"],
    .field input[type="email"],
    .field input[type="tel"] {
        flex: 1;
        height: 30px;
    }

    .field button {
        height: 30px;
        cursor: pointer;
        background-color: #4caf50;
        color: white;
        border: none;
        padding: 5px 10px;
    }

    /* 추가된 스타일 */
    .checkbox-group div {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    }
</style>
<div class="enroll-container">
    <div class="enroll-title">회원가입</div>
    <div class="enroll-line">*필수입력사항</div>
    
    <form id="enroll_form" action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post">
        <!-- 아이디 입력 -->
        <div class="field-id field">
            <div><b>아이디</b></div>
            <input type="text" placeholder="아이디를 입력해주세요" name="memberId" id="memberId" oninput="validateId()">
            <button type="button" id="id_du" class="modal_open"><span id="id_du_span">중복확인</span></button>
        </div>
        
        <!-- 아이디 중복확인 모달 -->
        <div class="modal fade" id="idcheck_modal">
            <!-- 모달 내용 생략 -->
        </div>

        <!-- 패스워드 입력 -->
        <div class="field">
            <b>패스워드</b>
            <input type="password" placeholder="비밀번호를 입력해주세요" name="memberPw" id="memberPw" oninput="validatePw()">
        </div>

        <!-- 패스워드 확인 입력 -->
        <div class="field">
            <b>패스워드 확인</b>
            <input type="password" placeholder="비밀번호를 한번 더 입력해주세요" id="memberPw2">
        </div>

        <!-- 이름 입력 -->
        <div class="field">
            <b>이름</b>
            <input type="text" placeholder="이름을 입력해주세요" name="memberName" id="memberName">
        </div>

        <!-- 이메일 입력 -->
        <div class="field">
            <b>이메일</b>
            <input type="email" placeholder="pet@it.com" name="memberEmail" id="memberEmail">
        </div>

        <!-- 휴대폰 입력 -->
        <div class="field">
            <b>휴대폰</b>
            <input type="tel" placeholder="숫자만 입력해주세요" name="memberPhone" id="memberPhone">
        </div>

        <!-- 주소 입력 -->
        <div class="field">
            <b>주소</b>
            <input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
            <input type="text" class="addr" id="memberZipCode" name="memberZipCode" placeholder="우편번호">
            <input type="text" class="addr" id="memberAddr" name="memberAddr" placeholder="주소"><br>
            <input type="text" class="addr" id="memberDetailAddr" name="memberDetailAddr" placeholder="상세주소">
        </div>

        <!-- 체크박스 그룹 -->
        <div class="checkbox-group">
            <!-- 전체 동의 -->
            <div>
                <label for="TermsAgreeAll">
                    <input id="TermsAgreeAll" type="checkbox" class="checkbox-input" value="Y" name="memberTersm">
                    <span>전체 동의합니다.</span>
                </label>
                <p class="description" style="font-size:12px">(선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.)</p>
            </div>

            <!-- 이용약관 동의(필수) -->
            <div>
                <input id="terms1" type="checkbox" value="Y">
                <span>이용약관 동의(필수)</span>
                <a href="#" id="te1">약관보기 ></a>
            </div>

            <!-- 개인정보 수집,이용 동의(필수) -->
            <div>
                <input type="checkbox" id="terms2" value="Y">
                <span>개인정보 수집,이용 동의(필수)</span>
                <a href="#" id="te2">약관보기 ></a>
            </div>

            <!-- 개인정보 수집,이용 동의(선택) -->
            <div>
                <input name="memberAccept" type="checkbox" value="Y">
                <span>개인정보 수집,이용 동의(선택)</span>
                <a href="#" id="te3">약관보기 ></a>
            </div>
        </div>

        <!-- 가입 버튼 -->
        <input class="submit" type="submit" value="가입하기">
        </form>
</div>
<%@ include file="/views/footer.jsp" %>