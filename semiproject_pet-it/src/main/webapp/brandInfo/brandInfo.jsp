<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/header.jsp"%>
 <style>
        .mainTilte{
            font-size: 50px;
            line-height: 54px;
            font-weight: 240;
            line-height: 300%;
            margin-bottom: 10px !important;
        }
    
    	.subTitle{
    		 font-size: 13px;
    		 line-height: 100%;
    	}
    	
    	.infoTitle{
    		 font-size: 10px;
    		 line-height: 200%;
    	}
    
        img {
             margin: content-box;
             overflow: clip;

            }
        .container{
        	padding-top : 80px;
            margin:0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

</style>

<!-- jh_브랜드소개 메인페이지 -->
 <div class="container"> <!-- 전체 감싸는 div -->
    <div class="space"></div> <!--윗간격 공백 div -->
    <div class="infoTitle"> <!-- 메인 타이틀 -->
        <h5 class="subTitle">번려동물의 행복과 건강을 위한 발걸음</h5>
        <h2 calss="mainTilte">Pet-it Loves Pet</h2>
        <p>
            반려동물의 힘찬 발걸음과 행복 가득한 미소가 오래오래 빛날 수 있도록 <br>
            Pet-it으로 초대합니다!<br>
        </p>
    </div>
    <img src="<%=request.getContextPath()%>/img/shushu.jpg" width="300" height="300" class="brandInfoPohto">
    &nbsp;
    <div class="Content"> <!-- 메인내용제목-->
        <h3 class=mainContentTitle>반려동물의 행복을 위하는 Pet-it </h3>
        <p>
            반려동물 사랑 어쩌고 
            <br>
            행복한 반려동물 어쩌고 
            <br>
            반려동물들을 위하는 반려인들의 마음에 누구보다 공감하며
            <br>
            함께 하는 시간을 소중이 하는 어쩌고 초심 어쩌고 
            <br>
            노력하는 Pet-it 입니다.  
            <br>
        </p>
    </div>
    <img src="<%=request.getContextPath()%>/img/sena.jpg" width="300" height="300" class="brandInfoPohto">
    &nbsp;
    <div class="Content"> <!-- 메인내용제목2-->
        <h3 class=mainContentTitle> Pet-it 의 약속</h3>
        <p>
           <strong>품질</strong>
           <br><br>
           네츄럴코어의 유기농 제품은 원료의 씨앗시기부터 이력을 철저하게 관리하고
           <br>
           교차 오염 방지를 위해 도로로부터 멀리 떨어진 공장에서 제품을 생산하며
           <br>
           체계적인 라인으로 최상의 품질을 자신합니다.
           <br><br>
           <strong>고객서비스</strong> 
           <br>
           최고의 고객서비스는 끊임없는 공부를 바탕으로
           <br>
           전문적인 지식을 갖추고 반려동물의 감정을
           <br>
           헤아리며 제공하는 서비스 입니다.
           <br><br>
           <strong>환경</strong>
           <br>
           살충제, 방부제, 잔류농약, 유해물질, GMO(유전자 변형물질), 멜라민 등
           <br>
           유해한 요소를 배제한 원료를 사용해 유기농 제품을 생산하며
           <br>
           친환경적인 자원 순환 생태계 조성에 기여합니다.
           <br><br>
           <strong>열정</strong>
           <br>
           차별화된 제품 생산을 통해 최고급 반려동물 식품을 국내에 공급하고
           <br>
           해외 유기농 식품 및 간식 시장 개척에도 끊임없이 힘쓰고 있습니다.
        </p>
    </div>
        <div class="lastContent">
            <h3>우리 아이들의 행복을 위해 Pet-it 하세요.</h3>
        </div>
    
</div>

<%@ include file = "/views/footer.jsp"%>