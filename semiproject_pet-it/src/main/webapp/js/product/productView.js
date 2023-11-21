



/*===========================================================================*/
/*	const editor = new toastui.Editor({
	 el: document.querySelector('#editor-container'), // 에디터를 적용할 요소 (컨테이너)
	 height: '500px',                        // 에디터 영역의 높이 값 (OOOpx || auto)
	 initialEditType: 'markdown',            // 최초로 보여줄 에디터 타입 (markdown || wysiwyg)
	 initialValue: '',     					// 내용의 초기 값으로, 반드시 마크다운 문자열 형태여야 함
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
									  dataType: 'json', 
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
 });*/

/*  $("#enroll-itemcontent-btn").on("click",function(){
	  document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
	  //콘솔창에 표시
	  console.log(editor.getHTML());	
  }) */

$("input[type=button]").on("click", function() {
	open("<%=request.getContextPath()%>/product/enroll_mainimage.jsp", "_blank", "width=650px, height=500px, top=50, left=300");

})
let count = 0;
$("#option-btn").on("click", (e) => {
	if (count < 2) {
		const optionBox = $(".detail-container-r");
		const test = $("<div class='enroll-content-container '></div>");
		const test2 = $("<div class='enrollpage-title'></div>");
		const test3 = $("<div class='enrollpage-content new-option'></div>");
		$(test).append(test2);
		$(test).append(test3);
		const inputName = $('<input type="text" name="optionName" id="optionName"+ placeholder="가격옵션명" />');
		$(test3).append(inputName);
		const inputPrice = $('<input type="number" name="optionPrice" id="optionPrice" placeholder="가격" />');
		$(test3).append(inputPrice);
		$(optionBox).append(test);
		++count;
	}
});

/* 모달 컨트롤 스크립트  */
$("#enroll-itemcontent-btn").on("click", function() {
	$(".modal").css("display", "block").css("top", "230px");

	$(".modal-footer>.btn:nth-child(1)").click(function() {
		console.log("이벤트발생");
		$(".modal").css("display", "none");
	})

	$(".modal-footer>.btn:nth-child(2)").click(function() {
		console.log("이벤트발생");
		const editorData = editor.getHTML();
		$(".modal").css("display", "none");
		$("#product-content").val(editorData);
		/*const formdata = $(".product-enroll-container").serialize();*/
		$(".product-enroll-container>form").submit();


		location.href = '<%=request.getContextPath()%>/product/productlist.jsp';
		/* ajax or get-> queryString방식으로 product# 넘기기 ,  */
	})
});


/* console.log(formdata); */
/* alert("asd"); */
const optionArr = [];
$.each($(".option>input[name=optionName]"), (i, e) => {
	/* console.log($(e).val()); */
	optionArr.push($(e).val());
	console.log(optionArr);
})