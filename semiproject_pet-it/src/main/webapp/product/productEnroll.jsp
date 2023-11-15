<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<!-- TUI 에디터 JS CDN -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TUI 에디터 CSS CDN -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productenroll.css"/>
<<<<<<< HEAD
<!-- <script	src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script> -->
<style>
	#image-box{
		border: 1px solid #04aa6d;
	}
	
	#main-image{
		width:328px;
	}
	.img-container > form{
		display:flex;
		flex-direction:column;
		align-items:center;
	}

</style>
<script>
$(function(){
$("#main-image").change(e=>{
	$.each(e.target.files,(i,f)=>{
		
	//fileReader 클래스를 이용해서 inputfile에 저장된 데이터를 가져와 출력할 수 있다.
	const filereader=new FileReader();
	/* filereader.readAsDataURL(e.target.files[0]); */
	filereader.readAsDataURL(f);
	filereader.onload=(e)=>{
		/* 파일 가상 주소 */
		const path=e.target.result;
		const img=$("#image-box").attr({
			"src":path,
			"width":"328",
			"height":"329"
		});
		$("#prevImg").append(img);
	}
	})
});
})
</script>

<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

<div class="wrapper">
	<div class="product-enroll-wrapper">
		<div class="product-enroll-container">
		   	<h2>상품등록</h2>
		   	<div class="line"></div>
			<form action="<%=request.getContextPath()%>/product/productEnrollEnd.do" method="post"  enctype="multipart/form-data" >
			<div class="product-detail-container">
				<div class="detail-container-l">
					<div class="img-container">
						<img id="image-box" src="<%=request.getContextPath()%>/img/Image-Size.jpg"/>
						<input type="file" class="btn btn-outline-success" name="mainImage" id="main-image"/>
					</div>
				</div>
				<div class="detail-container-r">
				<!-- 입력데이터 DB 저장 후 저장된 정보를 가지고 product List에서 해당 컬럼데이터에 맞게 출력 -->

<!-- 				<input type="file" name="mainImage" id="main-image" style="display:none"/> -->

					<input type="hidden" name="content" id="product-content"/>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>상품명 : </h4>
						</div>
						<div class="enrollpage-content">
							<input type="text" name="productName" placeholder="상품명을 입력하세요" required/>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>가격 : </h4>
						</div>
						<div class="enrollpage-content">
							<input type="number" name="productPrice" placeholder="상품가격을 입력하세요" min="0" step="1000" required/>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>한줄설명 : </h4>
						</div>
						<div class="enrollpage-content">
							<input type="text" name="productSummary" placeholder="상품소개 간단히 한줄 요약" required/>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>재고: </h4>
						</div>
						<div class="enrollpage-content">
							<input type="number" name="productStock" placeholder="판매 재고 개수 입력" min="0" required/>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>카테고리: </h4>
						</div>
						<div class="enrollpage-content category" style="text-align:center;">
						<span>1차 분류</span> 
							<select name="1st_category" style="width:150px">
								<option value="C-1">Dog</option>
								<option value="C-2">Cat</option>
							</select>
						<span>2차 분류</span>
							<select name="2nd_category" style="width:150px">
								<option value="T-1">사료</option>
								<option value="T-2">간식</option>
								<option value="T-3">용품</option>
							</select>
						</div>
					</div>
					<div class='enroll-content-container'>
						<div class="enrollpage-title">
							<h4>옵션 : </h4>
							<button type="button" id="option-btn">+</button>
						</div>
						<div class="enrollpage-content option">
							<input type="text" name="optionName" placeholder="가격옵션명" />
							<input type="number" name="optionPrice" placeholder="가격" />
						</div>
					</div>		
				
				</div>
				</form>
			</div>
		</div>
	    <!-- 에디터를 적용할 요소 (컨테이너) -->
	    <div class="editor-wrapper">
		    <div id="editor-container">
				<form action="<%=request.getContextPath()%>/product/productFileUpload.do" method="post">  
				<div id="editor"></div>
				<input type="button" class="btn btn-secondary mt-3 mx-2" value="작성취소" />
				<input type="hidden" value="" name="upload" id="upload">
				<button id="submit">전송</button>
				</form>
		    </div>
		    <div class="editor-botton-container">
		    	<button id="enroll-itemcontent-btn" class="btn btn-outline-success">등록완료</button>
		    	
		    </div>
	    </div>
		
	    <!-- 등록확인 모달 -->
                    <div class="modal" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">상품등록</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body" style="text-align:center;">
					        <p>상품을 등록하시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!--  -->
	</div>
</div>

   <!-- =======================================================================================================  -->
    <script>
        <%-- const editor = new toastui.Editor({
            el: document.querySelector('#editor-container'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
<<<<<<< HEAD
            initialValue: '',     					// 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
            
            hooks: {
=======
            initialValue: '내용을 입력해 주세요.',     // 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
            	hooks: {
>>>>>>> refs/heads/dev
       		    	addImageBlobHook: (blob, callback) => {
       		    		// blob : Java Script 파일 객체
       		    		//console.log(blob);
       		    		
       		    		const formData = new FormData();
       		        	formData.append('image', blob);
       		        	
       		        	let url = '/images/';
       		   			$.ajax({
       		           		type: 'POST',
       		           		enctype: 'multipart/form-data',
       		           		url: '<%=request.getContextPath()%>/product/productFileUpload.do',
       		           		data: formData,
       		           		dataType: 'json',
       		           		processData: false,
       		           		contentType: false,
       		           		cache: false,
       		           		timeout: 600000,
       		           		success: function(data) {
<<<<<<< HEAD
       		           			alert('ajax 이미지 업로드 성공');
       		           			url += data;
       		           			console.log(url);
=======
       		           			console.log('ajax 이미지 업로드 성공');
       		           			url += data.filename;
       		           			
>>>>>>> refs/heads/dev
       		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
       		        			// 형식 : ![대체 텍스트](주소)
       		           			callback(url, '사진 대체 텍스트 입력');
       		           		},
       		           		error: function(e) {
       		           			console.log('ajax 이미지 업로드 실패');
       		           			console.log(e);
       		           			//console.log(e.abort([statusText]));
       		           			
       		           			callback('image_load_fail', '업로드 실패');
       		           		}
       		           	});
       		    	}
        		    }
        }); --%>
        
       /*  $("#enroll-itemcontent-btn").on("click",function(){
        	document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
            //콘솔창에 표시
            console.log(editor.getHTML());	
        }) */
        
        $("input[type=button]").on("click",function(){
          	open("<%=request.getContextPath()%>/product/enroll_mainimage.jsp","_blank","width=650px, height=500px, top=50, left=300");
        })
        
     	$("#option-btn").on("click",(e)=>{
        	/* alert("이벤트발생"); */
        	const optionBox = $(".detail-container-r>form");
        	const test = $("<div class='enroll-content-container'></div>");
        	const test2 = $("<div class='enrollpage-title'></div>");
        	const test3 = $("<div class='enrollpage-content option'></div>");
        	$(test).append(test2);
        	$(test).append(test3);
        	const inputName = $('<input type="text" name="optionName" placeholder="가격옵션명" />');
        	$(test3).append(inputName);
        	const inputPrice = $('<input type="number" name="optionPrice" placeholder="가격" />');
        	$(test3).append(inputPrice);
        	$(optionBox).append(test);
        	
        });
      
        $("#enroll-itemcontent-btn").on("click",function(){ 	
        	$(".modal").css("display","block").css("top","230px");
           	           	
           	$(".modal-footer>.btn:nth-child(1)").click(function(){
           		console.log("이벤트발생");
           		$(".modal").css("display","none");
           	})
           	
           	$(".modal-footer>.btn:nth-child(2)").click(function(){
           		console.log("이벤트발생");
           		const editorData = editor.getData();
           		$(".modal").css("display","none");
           	 	$("#product-content").val(editorData);
           		const formdata = $(".product-enroll-container").serialize();
            	$(".product-enroll-container>form").submit();
         
              	
           		<%-- location.href='<%=request.getContextPath()%>/product/productlist.jsp'; --%>
           		/* ajax or get-> queryString방식으로 product# 넘기기 ,  */
           	})
        	
           	
        	/* console.log(formdata); */
        	/* alert("asd"); */
        	const optionArr = [];
        	$.each($(".option>input[name=optionName]"),(i,e)=>{
        		/* console.log($(e).val()); */
        		optionArr.push($(e).val());
        		console.log(optionArr);
        	})
        	/* header, body로 나눠서 보낸다. real!!! */
        	<%-- $.ajax({
        		url:'<%=request.getContextPath()%>/productListServlet.do',
        		type:"get",
        		data:formdata, /* json은 아님 */
        		/* contentType: 'application/json; charset=utf-8', */
        		success:data=>{
        			console.log(data);
        		},
        		error:(r,e)=>{
        			console.log(r);
        			console.log(e);
        		}
        	}); --%>
        })
<<<<<<< HEAD
   
=======
       
    var editor;
	ClassicEditor
	.create(document.querySelector('#editor-container'), {
		ckfinder: {
			uploadUrl : '<%=request.getContextPath()%>/upload/productdetailImg/'
		}
	})
	.then(e => {
		editor = e;
		console.log('Editor was initialized');
	})
	.catch(error => {
		console.error(error);
	});
	
	function test(){	
	    const editorData = editor.getData();
	    /* console.log(editorData); */
	    $("#upload").attr("value",editorData);
	    console.log($("#upload").val());
	}
	    
>>>>>>> refs/heads/dev
  
    </script>


<%@ include file="/views/footer.jsp" %>