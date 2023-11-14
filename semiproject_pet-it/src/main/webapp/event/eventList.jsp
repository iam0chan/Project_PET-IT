<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>

    
    
<style>
        * {
            margin: 0;
            padding: 0;
        }

        .event-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            line-height: 1;
            padding-top:80px;
        }

        .header-container,
        .item-container {
            width: 1200px;
        }

        .header-title {
            margin-bottom: 30px;
            align-items: center;
        }
        .sub-title{
            margin-bottom: 30px;
            align-items: center;
        }

        .header-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        .item-content{
            margin-bottom: 30px;
            align-items: center;
        }

        .title-container>.container {
            display: flex;
            width: 1200px;
            /* background-color: yellow; */
            flex-wrap: wrap;
            justify-content: space-evenly;
            margin-bottom: 20px;
        }
 
        .title-container>.container>.card {
            width: 29%;
            height: 430px;
            /* border: 1px solid red; */
            margin-bottom : 42px;
            boder-radius: 5px;
        }
        .form-outline input{
            width: 250px;
        }

        .item-img{
        	height:350px;
        }
        
        .item-img>img{
        	width:100%;
        	height:100%;
        	
        }
        
        .item-content{
            display: flex;
    		flex-direction: column;
    		justify-content: center;
        	height:30%;
        }
        
        .pageingBar{
            text-align: center;
        }
        
        .eventImg{
        	width:320px;
        	height:340px;
        }
       .boardsearchAll {
	text-align: center;
	}
	
	#search {
	text-align: center;
	height: 25px;
	}
	
	.item-content{
		line-height : 10px;
	}
	.item-img{
		margin-bottom : 10px;
		text-align : center;
	}
	
	
    </style>
    
<div class="event-container">
        <div class="header-container">
            <div class="header-title">
                <h2>이벤트</h2>
            </div>
            <div class="sub-title">
                <p>Pet-it의 다양한 이벤트를 만나보세요</p>
            </div>
            
        </div>
        <div class="title-container">
            <div class="container">
                <div class="card">
                    <div class="item-img">
                    <a href="#">
                    	<img class="productImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[리뷰]Pet-it 베스트 리뷰어 10월 당첨자 발표</p>
                        <br>
                    	<p>2023-11-13</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>10월 50% 타임세일! (종료)</p>
                        <br>
                    	<p>2023-10-20</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[이벤트] Pet-it 제품 체험단 모집</p>
                        <br>
                    	<p>2023-10-15</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[리뷰]Pet-it 베스트 리뷰어 09월 당첨자 발표</p>
                        <br>
                    	<p>2023-10-04</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[리뷰]Pet-it 베스트 리뷰어 08월 당첨자 발표</p>
                        <br>
                    	<p>2023-08-31</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[리뷰]Pet-it 베스트 리뷰어 07월 당첨자 발표</p>
                        <br>
                    	<p>2023-07-29</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>사은품 이벤트</p>
                        <br>
                    	<p>2023-07-13</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>[리뷰]Pet-it 베스트 리뷰어 06월 당첨자 발표</p>
                        <br>
                    	<p>2023-06-28</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<a href="#">
                    	<img class="eventImg" src="<%=request.getContextPath()%>/img/shushu.jpg">
                    </a>
                    </div>
                    <div class="item-content">
                    	<p>캔 1000원 이벤트</p>
                        <br>
                    	<p>2023-06-11</p>
                    </div>
                </div>
            </div>
            <div class="pageingBar">
                <h2>페이징바 영역</h2>
                </div>
                
                <div class="boardsearchAll">
		<fieldset class="boardSearch">
			<p>
				<select id="searchKey" name="searchKey">
					<option value="subject">제목</option>
					<option value="subject">내용</option>
				</select> <input id="search" name="search" placeholder="입력하세요">
				<button class="btn btn-primary btn-sm">
					<a href="#none">SEARCH</a>
				</button>
			</p>
		</fieldset>
	</div>
                

                

                
            </div>
        </div>
    </div>
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<%@ include file="/views/footer.jsp"%>