<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pet.product.model.dto.*"%>
<%@ include file="/views/header.jsp"%>
<%
Product product = (Product) request.getAttribute("product");
ProductImageFile mainImg = (ProductImageFile) request.getAttribute("productFileImage");
%>
<!-- TUI 에디터 JS CDN -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TUI 에디터 CSS CDN -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/product/productenroll.css" />
<style>
#image-box {
	border: 1px solid #04aa6d;
}

#main-image {
	width: 328px;
}

.img-container>form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

div.option-fix {
	width: 501px;
	/* padding-left: 36px; */
}

input#optionName {
	width: 230px;
	padding: 0px 5px;
}

input#optionPrice {
	width: 230px;
}
</style>

<div class="wrapper">
	<div class="product-enroll-wrapper">
		<div class="product-enroll-container">
			<h2>상품수정</h2>
			<div class="line"></div>
			<form
				action="<%=request.getContextPath()%>/product/productUpdateEnd.do"
				method="post" accept-charset="utf-8" enctype="multipart/form-data"
				>
				<div class="product-detail-container">
					<div class="detail-container-l">
						<div class="img-container">
							<img id="image-box"
								src="<%=request.getContextPath()%>/upload/<%=mainImg.getProductFileRename()%>" />
							<input type="file" class="btn btn-outline-success"
								name="mainImage" id="main-image" value="" />
						</div>
					</div>
					<div class="detail-container-r">
						<!-- 입력데이터 DB 저장 후 저장된 정보를 가지고 product List에서 해당 컬럼데이터에 맞게 출력 -->
						<!-- 				<input type="file" name="mainImage" id="main-image" style="display:none"/> -->
						<input type="hidden" name="productNo"
							value="<%=product.getProductNo()%>" /> <input type="hidden"
							name="content" id="product-content" />
						<div class='enroll-content-container'>
							<div class="enrollpage-title">
								<h4>상품명 :</h4>
							</div>
							<div class="enrollpage-content">
								<input type="text" name="productName"
									placeholder="상품명을 입력하세요." maxlength="20"
									value="<%=product.getProductName()%>"/>
							</div>
						</div>
						<div class='enroll-content-container'>
							<div class="enrollpage-title">
								<h4>가격 :</h4>
							</div>
							<div class="enrollpage-content">
								<div class="price-container">
									<input type="number" name="productPrice"
										placeholder="상품가격을 입력하세요" min="0" step="1000"
										value="<%=product.getProductPrice()%>" required
										style="padding-left: 10px;" />
								</div>
								<div class="discount-radio">
									<label for="discount"> <input class="discount"
										type="radio" id="discount" name="discount" value="0"
										<%=product.getProductDiscount().equals("0") ? "checked" : ""%>>
										없음
									</label> <label for="discount1"> <input class="discount"
										type="radio" id="discount1" name="discount" value="0.1"
										<%=product.getProductDiscount().equals("0.1") ? "checked" : ""%>>
										10%
									</label> <label for="discount2"> <input class="discount"
										type="radio" id="discount2" name="discount" value="0.2"
										<%=product.getProductDiscount().equals("0.2") ? "checked" : ""%>>
										20%
									</label> <label for="discount3"> <input class="discount"
										type="radio" id="discount3" name="discount" value="0.3"
										<%=product.getProductDiscount().equals("0.3") ? "checked" : ""%>>
										30%
									</label>
								</div>
							</div>
						</div>
						<div class='enroll-content-container'>
							<div class="enrollpage-title">
								<h4>한줄설명 :</h4>
							</div>
							<div class="enrollpage-content">
								<input type="text" name="productSummary"
									placeholder="상품 한줄 소개 (40자)" maxlength="40"
									value="<%=product.getProductInfo()%>" required />
							</div>
						</div>
						<div class='enroll-content-container'>
							<div class="enrollpage-title">
								<h4>재고:</h4>
							</div>
							<div class="enrollpage-content">
								<input type="number" name="productStock"
									placeholder="판매 재고 개수 입력" min="0"
									value="<%=product.getProductStock()%>" required />
							</div>
						</div>
						<div class='enroll-content-container'>
							<div class="enrollpage-title">
								<h4>카테고리:</h4>
							</div>
							<div class="enrollpage-content category"
								style="text-align: center;">
								<span>1차 분류</span> <select name="1st_category"
									style="width: 150px">
									<option value="C-1">Dog</option>
									<option value="C-2">Cat</option>
								</select> <span>2차 분류</span> <select name="2nd_category"
									style="width: 150px">
									<option value="T-1">사료</option>
									<option value="T-2">간식</option>
									<option value="T-3">용품</option>
								</select>
							</div>
						</div>
						<%
						if (product.getProductOption().isEmpty()) {
						%>
						<!-- 옵션 수정 창 (case : 옵션X) -->
						<div class='enroll-content-container option'>
							<div class="enrollpage-title option-title">
								<div style="padding-bottom: 14px;">
									<button type="button" id="option-btn-add"
										class="btn btn-success">+</button>
									<button type="button" id="option-btn-remove"
										class="btn btn-success">-</button>
								</div>
								<h4 style="width: 135px;">옵션 :</h4>
							</div>
							<div class="enrollpage-content option">
								<input type="hidden" name="optionNo" id="optionNo" value="" /> <input
									type="text" name="optionName" id="optionName"
									placeholder="가격옵션명" value="기본" required /> <input type="number"
									name="optionPrice" id="optionPrice" placeholder="가격"
									value="<%=product.getProductPrice()%>" required />
							</div>
							<div id="option-btn" style="line-height: 3.0"></div>
						</div>
						<%
						} else {
						%>
						<%
						int count = 0;
						%>
						<%
						for (ProductOption op : product.getProductOption()) {
						%>
						<!-- 옵션 수정 창 (case : 옵션O) -->
						<div class='enroll-content-container option'>
							<div class="enrollpage-title option-title">
								<div style="padding-bottom: 14px;">
									<%
									if (count == 0) {
									%>
									<button type="button" id="option-btn-add"
										class="btn btn-success">+</button>
									<button type="button" id="option-btn-remove"
										class="btn btn-success">-</button>
									<%
									}
									%>
								</div>
								<%
								if (count == 0) {
								%>
								<h4 style="width: 135px;">옵션 :</h4>
								<%
								++count;
								System.out.println("count: " + count);
								%>
								<%
								}
								%>
							</div>
							<div class="enrollpage-content option-fix">
								<input type="hidden" name="optionNo" id="optionNo"
									value="<%=op.getProductOptionNo()%>" /> <input type="text"
									name="optionName" id="optionName" placeholder="가격옵션명"
									value="<%=op.getProductOptionName()%>" /> <input type="number"
									name="optionPrice" id="optionPrice" placeholder="가격"
									value="<%=op.getProductOptionPrice()%>" />
							</div>
							<div id="option-btn" style="line-height: 3.0"></div>
						</div>
						<%
						}
						%>
						<%
						}
						%>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 에디터를 적용할 요소 (컨테이너) -->
	<div class="editor-wrapper">
		<div id="editor-container" style="width: 1050px;"></div>
		<div class="editor-botton-container">
			<button id="enroll-itemcontent-btn" class="btn btn-outline-success">수정완료</button>
		</div>
	</div>

	<!-- 등록확인 모달 -->
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">상품정보 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<p>상품 수정을 완료하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">수정</button>
					<input type="hidden" id="content-file-enroll" value="" />
				</div>
			</div>
		</div>
	</div>
	<!--  -->
</div>


<!-- =======================================================================================================  -->

<script>

    	
    	
        const editor = new toastui.Editor({
            el: document.querySelector('#editor-container'), // 에디터를 적용할 요소 (컨테이너)
            height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
            initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
            initialValue: '<%=product.getProductContent()%>',     					// 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
            previewStyle: 'vertical',                // 마크다운 프리뷰 스타일 (tab || vertical)
            hooks: {
       		    	addImageBlobHook: (blob, callback) => {
       		    		// blob : Java Script 파일 객체
       		    		console.log("blob:",blob);
       		    		
       		    		const formData = new FormData();
       		    		formData.append("image", blob);
       		    		console.log(formData);
       		        	
       		        	let url = "<%=request.getContextPath()%>"+'/upload/';
       		        	$.ajax({
       		           		type: 'POST',
       		           		enctype: 'multipart/form-data',
       		           		url: '<%=request.getContextPath()%>/product/productFileUpload.do',
       		           		data: formData,
       		           		/* dataType: 'json', */
       		           		processData: false,
       		           		contentType: false,
       		           		cache: false,
       		           		success: function(data) {
       		           			alert('ajax 이미지 업로드 성공');
       		           			url += data;
       		           			console.log(url);
       		           			// callback : 에디터(마크다운 편집기)에 표시할 텍스트, 뷰어에는 imageUrl 주소에 저장된 사진으로 나옴
       		        			// 형식 : ![대체 텍스트](주소)
       		           			callback(url, data);
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
        });

        
        let count = 0;
        $("#option-btn-add").on("click",(e)=>{
           console.log($(".option").length);
           if($(".option").length<3){
           const optionBox = $(".detail-container-r");
           const div1 = $("<div class='enroll-content-container option'></div>");
           const div2 = $("<div class='enrollpage-title'></div>");
           const div3 = $("<div class='enrollpage-content option'></div>");
           $(div1).append(div2);
           $(div1).append(div3);
           const inputName = $('<input type="text" name="optionName" id="optionName"+ placeholder="가격옵션명" />');
           $(div3).append(inputName);
           const inputPrice = $('<input type="number" name="optionPrice" id="optionPrice" placeholder="가격" />');
           $(div3).append(inputPrice);
           $(optionBox).append(div1);
           ++count;
           }
        });
        $("#option-btn-remove").on("click",function(){
        	if($(".option").length!=1){
        	const target = $(".option").last();
        	console.log(target);
        	target.remove("");
        	}
        	/* const target2 = $(".option:last-child()").remove(); */
        })
      
 /*        $("#enroll-itemcontent-btn").on("click",function(){
        	if($("#optionName").val().trim()=="" || $("#optionName").val()=="null"){
    			alert("옵션명과 가격을 입력하세요, 옵션추가를 원하지 않을경우 '기본','제품가격'을 입력해주세요.");
    			return false;
    		}
    		return true;
        })
         */
       /* 모달 컨트롤 스크립트  */
        $("#enroll-itemcontent-btn").on("click",function(){
    		
           $(".modal").css("display","block").css("top","230px");
                            
              $(".modal-footer>.btn:nth-child(1)").click(function(){
                 console.log("이벤트발생");
                 $(".modal").css("display","none");
              })
              
              $(".modal-footer>.btn:nth-child(2)").click(function(){
                 console.log("이벤트발생");
                 const editorData = editor.getHTML();
                 $(".modal").css("display","none");
                  $("#product-content").val(editorData);
               $(".product-enroll-container>form").submit();
         
                 
                
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
       
	$(function(){
	$("#main-image").change(e=>{
		$.each(e.target.files,(i,f)=>{
		var filereader=new FileReader();
		//fileReader 클래스를 이용해서 inputfile에 저장된 데이터를 가져와 출력할 수 있다.
		/* filereader.readAsDataURL(e.target.files[0]); */
		filereader.readAsDataURL(f);
		filereader.onload=(e)=>{
			/* 파일 가상 주소 */
			const path=e.target.result;
			console.log(path);
			const img=$("#image-box").attr({
				"src":path,
				"width":"328",
				"height":"329"
			});
		}
		})
	});
	}) 
   
  
    </script>


<%@ include file="/views/footer.jsp"%>