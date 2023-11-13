<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<!-- TUI 에디터 JS CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TUI 에디터 CSS CDN -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productenroll.css"/>
<div class="wrapper">
	<div class="product-enroll-wrapper">
		<div class="product-enroll-container">
		   	<h2>상품등록</h2>
		   	<div class="line"></div>
			<div class="product-detail-container">
				<div class="detail-container-l">
					<div class="img-container">
						<img id="image-box" src=""/>
						<input type="button" class="btn btn-outline-success" value="대표이미지업로드"/>
					</div>
				</div>
				<div class="detail-container-r">
				<!-- 입력데이터 DB 저장 후 저장된 정보를 가지고 product List에서 해당 컬럼데이터에 맞게 출력 -->
				<form action="" method="post" style="margin-top:30px;">
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
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>한줄설명 : </h4>
						</div>
						<div class="enrollpage-content">
							<input type="text" name="productSummary" placeholder="상품소개 간단히 한줄 요약" />
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>카테고리: </h4>
						</div>
						<div class="enrollpage-content category" style="text-align:center;">
						<span>1차 분류</span> 
							<select name="1st_category" style="width:150px">
								<option value="1">Dog</option>
								<option value="2">Cat</option>
							</select>
						<span>2차 분류</span>
							<select name="2nd_category" style="width:150px">
								<option value="1">사료</option>
								<option value="2">간식</option>
								<option value="3">용품</option>
							</select>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>옵션 : </h4>
							<button id="option-btn">+</button>
						</div>
						<div class="enrollpage-content option">
							<input type="text" name="optionName" placeholder="가격옵션명" />
							<input type="number" name="productSummary" placeholder="가격" />
						</div>
					</div>
					
				</form>
				</div>
				
			</div>
		</div>
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <div class="editor-wrapper">
		    <div id="editor-container">
				
		    </div>
		    <div class="editor-botton-container">
		    	<button id="enroll-itemcontent-btn" class="btn btn-outline-success">등록완료</button>
		    	
		    </div>
	    </div>
	</div>
</div>

<!-- 테스트 container -->
<div id="contents">
	 
</div>
   <!-- =======================================================================================================  -->
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor-container'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical'                // 마크다운 프리뷰 스타일 (tab || vertical)
        });
        
        $("#enroll-itemcontent-btn").on("click",function(){
        	document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
            //콘솔창에 표시
            console.log(editor.getHTML());	
        })
        $("input[type=button]").on("click",function(){
        	open("<%=request.getContextPath()%>/product/enroll_mainimage.jsp","_blank","width=650px height=450px");
        })
        
     	document.querySelector("#option-btn").addEventListener("click",(e)=>{
        	/* alert("이벤트발생"); */
        	console.log(e);
        });
    </script>
<%@ include file="/views/footer.jsp" %>