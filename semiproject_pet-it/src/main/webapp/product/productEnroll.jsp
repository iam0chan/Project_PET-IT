<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>
<!-- TUI 에디터 JS CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TUI 에디터 CSS CDN -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>
	*{
		margin: 0px;
		padding: 0px;
		border: 1px solid red;
	}
	.wrapper{
		width:100%;
		display: flex;
		justify-content:center;
	}
	.product-enroll-wrapper{
		width:1200px;
		
    	
	}
	
	.product-enroll-container>div{
		margin: 0 auto;
		margin-bottom:30px;
	}
	
	.product-enroll-container > h2{
		text-align:center;
		padding-top: 80px;
		margin-bottom:3px;
		
		
	}
	
	.product-detail-container{
		width:1200px;
		display:flex;
	}
	
	.detail-container-l{
		width:600px;
		display:flex;
		flex-direction:column;
		align-items:flex-end;
	}
	
	.detail-container-l img{
		width:230px;
		height:260px;
		margin-bottom:2px;
	}
	
	.img-container{
		display:flex;
		flex-direction:column;
	}
	
	.detail-container-r{
		width:800px;
		display:flex;
		flex-direction:column;
		align-items:center;
	}
	
	
	
	.enroll-content-container{
		width:100%;
		height:45px;
		display:flex;
		justify-content:center;
	}
	.enrollpage-title{
		width:120px;
		display:flex;
		justify-content:center;
	}
	.enrollpage-content{
		width:400px;
		display:flex;
		align-items:center;
	}
	.enrollpage-content>input{
		height: 40px;
    	width: 360px;
    	padding-left:10px;
	}
	.enrollpage-title{
		display:flex;
		align-items:center;
		
	}
	.enrollpage-title > h4{
		width:140px;
		height:40px;
		letter-spacing:4px;
		text-align:right;
		margin-bottom:0;
	}
	.line{
		width:200px;
		border-top:8px solid #04aa6d;
		height:40px;
	}
</style>
<div class="wrapper">
<div class="product-enroll-wrapper">
	<div class="product-enroll-container">
	   	<h2>상품등록</h2>
	   	<div class="line"></div>
		<div class="product-detail-container">
			<div class="detail-container-l">
				<div class="img-container">
					<img src=""/>
					<button type="button" class="btn btn-outline-success">대표이미지업로드</button>
				</div>
			</div>
			<div class="detail-container-r">
			<form action="" method="get">
				<div class='enroll-content-container'>
					<div class="enrollpage-title">
						<h4>상품명 : </h4>
					</div>
					<div class="enrollpage-content">
						<input type="text" name="productName" placeholder="상품명을 입력하세요"/>
					</div>
				</div>
				<div class='enroll-content-container'>
					<div class="enrollpage-title">
						<h4>가격 : </h4>
					</div>
					<div class="enrollpage-content">
						<input type="number" name="productPrice" placeholder="상품가격을 입력하세요" min="0" step="1000"/>
					</div>
				</div>
			</form>
			</div>
			
		</div>
	</div>
    <!-- 에디터를 적용할 요소 (컨테이너) -->
    <div id="editor-content">
	
    </div>
</div>
</div>







    
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor-content'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
        });
    </script>
<%@ include file="../views/footer.jsp" %>