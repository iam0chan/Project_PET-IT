   		const review = document.querySelector("#review-btn");
       	
       	review.addEventListener('click',()=>{
       		open("<%=request.getContextPath()%>/product/review_write.jsp","_blank","width=800px,height=500px")
       	})
       	
       	
       	const value = $("#product-order-amount");
       	const price = $(".total-price>span>strong");
       	var num = Number(value.val());
       	let changePrice = price.text();
       	 	$('#option-select').on("change",function(){
			   /*changePrice = price.text();*/
			   num = 1;
			   $("total-price")
			   console.log(changePrice);
			   alert("이벤트");
			   const optionPrice = $('#option-select').val();
			   changePrice = optionPrice;
			   console.log(optionPrice, typeof optionPrice);
			   $('.total-price>span>strong').text(optionPrice);
			   $('#product-order-amount').val("1");
		 });
		 
       	
       	$("#btn-r").click(function(){
       		if(num<99){
   				num = num+1;
   				value.val(num);
   				price.text(changePrice*num);
   				console.log(price.text());
       		}else{
       			alert("주문 가능 최대 갯수는 99개 입니다.");
       		}

       	})
       	
       	$("#btn-l").click(function(){
       		if(num>1){
	   			num = num-1;
	   			value.val(num);
   				price.text(parseInt(price.text())-changePrice);
	   			/* console.log(num); */
       		}else{
       			num = 1;
       		}

       	})
       	
      
       	
       	/* 장바구니 modal창 출력 */
       	$("#cart-btn").click(function(){
       		$(".modal").css("display","block").css("top","230px");
       	})
       	
       	/* modal창 취소 버튼 이벤트 */
       	$(".modal-footer>.btn:nth-child(1)").click(function(){
       		console.log("이벤트발생");
       		$(".modal").css("display","none");
       	})
       	
       	/* modal창 담기 버튼 이벤트 */
       	$(".modal-footer>.btn:nth-child(2)").click(function(){
       		console.log("이벤트발생");
       		$(".modal").css("display","none");
       		$("#content-file-enroll").val("true");
       		location.href='<%=request.getContextPath()%>/views/cart/cartList.jsp?productNo=<%=p.getProductNo()%>';
       		/* ajax or get-> queryString방식으로 product# 넘기기 ,  */
       	})
       	
       	
       	/*===========================================================================*/
       	const editor = new toastui.Editor({
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
        
      /*  $("#enroll-itemcontent-btn").on("click",function(){
        	document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHTML());
            //콘솔창에 표시
            console.log(editor.getHTML());	
        }) */
        
        $("input[type=button]").on("click",function(){
          	open("<%=request.getContextPath()%>/product/enroll_mainimage.jsp","_blank","width=650px, height=500px, top=50, left=300");

        })
        let count = 0;
        $("#option-btn").on("click",(e)=>{
           if(count<2){
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
                 /*const formdata = $(".product-enroll-container").serialize();*/
               $(".product-enroll-container>form").submit();
         
                 
               location.href='<%=request.getContextPath()%>/product/productlist.jsp';
                 /* ajax or get-> queryString방식으로 product# 넘기기 ,  */
              })
           });
           
              
           /* console.log(formdata); */
           /* alert("asd"); */
           const optionArr = [];
           $.each($(".option>input[name=optionName]"),(i,e)=>{
              /* console.log($(e).val()); */
              optionArr.push($(e).val());
              console.log(optionArr);
           })
      
          function purchase(){
			  const productNo = $.trim($("#productNo").val());
			  const purchasePrice = $.trim($(".total-price>span>strong").text());
			  const purchaseAmount = $.trim($("#product-order-amount").val());
			  /*const purchaseProductOptionName = $("#option-select>option").text();*/
			 alert("구매하기창으로 데이터 전달");
	         $.ajax({
	              url:"<%=request.getContextPath()%>/test",
	              type:"get",
	              data:{productNo:productNo,
					  	purchasePrice:purchasePrice,
	              		purchaseAmount:purchaseAmount
	              		/*purchaseProductName:purchaseProductOptionName*/
	              		}, 
	              contentType:"application/json; charset=UTF-8",
	              success:data=>{
	                 console.log(data);
	              },
	              error:(r,e)=>{
	                 console.log(r);
	                 console.log(e);
	              }
	           });
		   };