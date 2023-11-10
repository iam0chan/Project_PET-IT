<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<style>
        * {
            margin: 0;
            padding: 0;
        }

        .product-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            line-height: 1;
        }

        .header-container,
        .item-container {
            width: 1200px;
        }

        .header-title {
            margin-bottom: 30px;
        }

        .header-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }

        .item-container>.container {
            display: flex;
            width: 1200px;
            background-color: yellow;
            flex-wrap: wrap;
            justify-content: space-evenly;
            margin-bottom: 20px;
        }

        .item-container>.container>.card {
            width: 29%;
            height: 500px;
            border: 1px solid red;
        }

        .product-wrapper .sort-list {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
}
        }

        .product-wrapper .sort-list>p {
            margin: 20px 5px;
            cursor: pointer;
        }

        .product-wrapper button {
            width: 100px;
            height: 40px;
        }

        .product-wrapper .button>div {
            display: flex;
            width: 600px;
            justify-content: space-between;
        }

        .product-wrapper .btn {
            width: 1200px;
            display: flex;
            justify-content: flex-end;
        }

        .product-wrapper div.btn>button {
            width: 100px;
            height: 40px;
            margin: 0 10px;
            margin-bottom: 1px;
        }

        .product-wrapper .search-bar{
            display: flex;
            width: 1200px;
            justify-content: center;
        }
        .form-outline input{
            width: 250px;
        }

        #search-button{
            width: 60px;
        }
        
        .item-img, item-content{
        	border: 1px solid red;
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
        
       
    	
    	div.search-bar .btn{
    		width: 60px;
    		
    	}
    </style>
    <script>
        const searchButton = document.getElementById('search-button');
        const searchInput = document.getElementById('search-input');
        searchButton.addEventListener('click', () => {
            const inputValue = searchInput.value;
            alert(inputValue);
        });
    </script>
<div class="product-wrapper">
        <div class="header-container">
            <div class="header-title">
                <h1>DOG</h1>
            </div>
            <div class="button">
                <div>
                    <button>샘플</button>
                    <button>샘플</button>
                    <button>샘플</button>
                    <button>샘플</button>
                    <button>샘플</button>
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
            <div class="bottom-container">
                <div class="btn">
                    <button>수정</button>
                    <button>삭제</button>
                </div>
                <div class="search-bar">
                    <form class="d-flex">
                      <input class="form-control me-2" type="search" placeholder="상품검색" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass search-icon" style="width:50px;margin-top:5px"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/views/footer.jsp"%>