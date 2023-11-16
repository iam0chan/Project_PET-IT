<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productlist.css"/>
    <script>
    /*     const searchButton = document.getElementById('search-button');
        const searchInput = document.getElementById('search-input');
        searchButton.onclick( () => {
            const inputValue = searchInput.value;
            alert(inputValue);
        }); */
        
        $(".btn").mouseenter(function(){
        	console.log($(".btn"));
			$(this).css("background-color","#04aa6d");
		})
    </script>
<div class="product-wrapper">
        <div class="header-container">
            <div class="header-title">
                <h1>DOG</h1>
            </div>
            <div class="button">
                <div class="btn-container">
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>신상품</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 베스트</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 사료</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 간식</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 용품</a></button>
                </div>
            </div>
        </div>
        <div class="item-container">
            <div class="sort-list">
                <p>인기상품</p>
                <p>조회순</p>
                <p>신상품</p>
                <p>금액오름차순</p>
                <p>금액내림차순</p>
            </div>
            <div class="container">
                <div class="card">
                    <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
                <div class="card">
                     <div class="item-img">
                    	<img src="https://images.chosun.com/resizer/lGyzt5Hi0efXfaeVhy5gXwXHilc=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/52PNRX6QMNCRDD3QBAFB6XJJ6M.jpg"/>
                    </div>
                    <div class="item-content">
                    	<p>세나가 좋아하는 간식</p>
                    	<p>슈가 질투할만한 간식</p>
                    	<p>10,900원</p>
                    </div>
                </div>
            </div>
            <div style="margin-bottom:25px;"> 
            	페이징바
            </div>
            <div class="bottom-container">
                <div class="search-bar">
                    <form class="d-flex">
                      <input class="form-control me-2" type="search" placeholder="상품검색" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass search-icon" style="width:50px;margin-top:5px"></i></button>
                    </form>
                </div>
                <div class="btn-bottom-container">
                <a class="admin-btn"href="<%=request.getContextPath()%>/product/productEnroll.do" style="color:#28A745;">
                    <button type="button" class="btn btn-outline-success button-bottom">
                    	등록
                    </button></a>
                    <a class="admin-btn"href="#" style="color:#28A745;">
                    <button type="button" class="btn btn-outline-success button-bottom">
                    	삭제
                    </button></a>
                </div>
            </div>
        </div>
    </div>
    <script>
    $(".admin-btn").mouseenter(function(){
		$(this).css("color","white");
	})   
	$(".admin-btn").mouseleave(function(){
		$(this).css("color","#28A745");
	})   
 
	$(".card").mouseenter(function(){
		$(this).css("cursor","pointer");
		$(this).click(function(){
			location.href='<%=request.getContextPath()%>/product/productview.jsp';	
		})
	})
	
    </script>
    
<%@ include file="/views/footer.jsp"%>