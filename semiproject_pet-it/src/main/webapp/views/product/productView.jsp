<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pet.product.model.dto.Product, com.pet.product.model.dto.ProductImageFile, com.pet.product.model.dto.ProductOption"%>
<%@ include file="/views/header.jsp" %>
<%
	Product p = (Product)request.getAttribute("product");
	int discountPrice = (int)(request.getAttribute("discountPrice"));
	ProductImageFile file = (ProductImageFile)request.getAttribute("file");
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productview.css"/>
    <div class="wrapper">
    	<div class="update-delete-btn-container">
    	<button id="update-itemcontent-btn" type="button" class="btn btn-outline-success button-bottom">수정</button>
    	<button id="delete-itemcontent-btn" type="button" class="btn btn-outline-success button-bottom">삭제</button>
    	</div>
        <div class="item-info-container">
            <div class="item-image">
                <div>
                	<%if(file!=null){ %>
                    <img src="<%=request.getContextPath()%>/upload/<%=file.getProductFileRename()%>" width="400px"
                        height="420px" id="item-image">
                     <%} %>
                </div>
                <!-- <div class="summary">
                    <span>상품설명란?</span>
                </div> -->
            </div>
            <div class="item-info">
                <div class="info item-tit2le">
                    <h1><%=p.getProductName() %></h1>
                    <p><%=p.getProductInfo() %></p>
                </div>
                <div class="info item-price-info">
                	<%if(p.getProductDiscount()!=null){ %>
                		<input class="price" id=<%=discountPrice%> style="display:none;">
                		<h3><%=p.getProductPrice()%>원 (할인가<%=discountPrice%>원)</h3>
                	<%}else{ %>
                    	<input class="price" id=<%=p.getProductPrice()%> style="display:none;">
                    	<h3><%=p.getProductPrice()%>원</h3>
                    <%} %>
                </div>
                <div class="info item-simple-description">
                    <sapn>
                    	<%=p.getProductInfo()%>
                    </sapn>
                </div>
              
                <div class="info item-option">
                    <div class="option" style="width: 300px;">
                        <select name="priceOption" id="option-select" style="width:280px;" onchange="chageOption();" style="text-align:center;">
                        	<option value="<%=p.getProductPrice()%>"><%=p.getProductPrice()%>원</option>
                        	<%if(p.getProductOptionStatus().equals("Y")){ %>
                        		<%for(int i=0; i<p.getProductOption().size(); i++){ %>
                        			<option value="<%=p.getProductOption().get(i).getProductOptionPrice()%>">
                        			<%=p.getProductOption().get(i).getProductOptionName()%>
                        			(<%=p.getProductOption().get(i).getProductOptionPrice() %>원)
                        			<%if(p.getProductPrice()>p.getProductOption().get(i).getProductOptionPrice()){ %>
                        				- <%=p.getProductPrice()-(p.getProductOption().get(i).getProductOptionPrice())%>
                        			<%}else{ %>
                        				+ <%=(p.getProductOption().get(i).getProductOptionPrice())- p.getProductPrice()%>
                        			<%} %>
                        			
                        			</option>
                        		<%} %>
                        	<%} %>
                        </select>
                        <script>
                        	function chageOption(){
		                        const select = $("option-select");
                        		alert(price);
                        	}
                        	
                        </script>
                    </div>
                    <div class="amountbtn">
                        <button id="btn-l" style="width: 20px;">-</button>
                        <input id="product-order-amount" type="text" value="1" min="0" style="text-align: right; width: 30px;" max="99">
                        <button id="btn-r" style="width: 20px;">+</button>
                    </div>
                </div>
                <div class="info total-price"><span>총 금액 <%if(p.getProductDiscount()==null){%><strong><%=p.getProductPrice()%></strong>원<%} else{
                %><strong><%=discountPrice%></strong>원<%} %></span></div>
                <input id="price" type="hidden" value="10900">
                <div class="info button-container">
                    <button class="btn btn-outline-success">구매하기</button>
                    <button id="cart-btn" class="btn btn-outline-success">장바구니</button>
                    <!-- 장바구니 모달 -->
                    <div class="modal" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">장바구니 확인</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <p>장바구니에 담으시겠습니까?</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary">담기</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!--  -->
                </div>
            </div>
        </div>
        <div class="item-description-container">
            <div class="description-header">
                <div>
                    <ul>
                        <a href="#check1" class=""><li style="background-color:#ccc; color:white;">상품상세정보</li></a>
                        <a href="#check2" class=""><li>상품구매안내</li></a>
                        <a href="#check3" class=""><li>구매후기</li></a>
                    </ul>
                </div>
            </div>
            <style>
            		.item-description img{
            			width:100%;
            		}
            	</style>
            <a id="check1"></a>
            <div class="item-description">
            	<%=p.getProductContent()%>
            </div>
        </div>
        <div class="item-instruction">
            <div class="description-header">
                <div>
                   <ul>
                        <a href="#check1" class=""><li>상품상세정보</li></a>
                        <a href="#check2" class=""><li style="background-color:#ccc; color:white;">상품구매안내</li></a>
                        <a href="#check3" class=""><li>구매후기</li></a>
                    </ul>
                </div>
            </div>
            <div class="item-instruction-container">
            <ul>
	            <a id="check2"></a>
                <li>
                    <h3>상품결제정보</h3>
                    <div>상품 주문은 장바구니에 상품 담기 > 회원/비회원 주문 > 주문서 작성 > 결제 방법 선택 및 결제 > 주문완료로 이루어집니다.</div>
                    <div>비회원 주문인 경우 주문번호를 메모해 두시기 바랍니다.</div>
                    <div><br></div>
                    "고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다."
                    <div>
                        "확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp;"
                        <br>
                        <br>
                        "무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  &nbsp;"
                        <br>
                        "주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 1일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다."
                    </div>
                </li>
                <li>
                    <h3>배송정보</h3>
                    <ul>
                        <li>배송 방법 : 택배</li>
                        <li>배송 지역 : 전국지역</li>
<!--                         <li>배송 비용 : 3,000원</li> -->
                        <li>배송 기간 : 3일 ~ 7일</li>
                        <li>
                            배송 안내 : 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.
                            <div>
                                네츄럴코어는 언제나 상품을 빠르고 안전하게 배달하기 위해 노력합니다.
                                <div>다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</div>
                            </div>
                        </li>
                    </ul>
                </li>
                <li>
                    <h3>교환 및 반품정보</h3>
                    <b>
                        <span style="font-size: 10pt;">
                            <span style="font-size: 12pt;">교환 및 반품주소</span>
                        </span>
                    </b>
                    <br>
                    "- [99999] 서울시 금천구 가산디지털단지로 펫잇물류센터"
                    <b>
                        <br>
                        <br>
                        <span style="font-size: 12pt;">교환 및 반품이 가능한 경우</span>
                    </b>
                    <br>
                    "- 교환 및 반품은 배송완료일 기준으로 7일 이내 가능합니다."
                    <div>
                       <br>
                       <b>교환 및 반품이 불가능한 경우</b>
                       <br>
                       <div>- 교환/반품 기간이 지난 경우</div>
                       <div>- 고객님의 책임있는 사유로 상품 등이 멸실 또는 훼손된 경우</div>
                       <div>- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우</div>
                       <div>- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</div>
                       <div>- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우</div>
                       <div>(자세한 내용은 고객센터 및 1:1상담을 이용해 주시기 바랍니다.)</div>
                       <div>
                        <br>
                       </div>
                       <div>※ 고객님의 변심으로 교환/반품을 하실 경우 왕복배송비는 고객님께서 부담하셔야 합니다.</div>
                       <div>(맛타입 교환,사이즈 교환 등 포함)</div>
                       <div>
                        <span style="font-size: 9pt;">※</span>
                        "&nbsp;상품의 불량 또는 파손, 오배송의 경우에는 네츄럴코어에서 배송비를 부담합니다.
                       </div>
                    </div>
                </li>
                <li>
                    <h3>서비스문의</h3>
                    "서비스 문의는 고객센터 (031-711-0595)로 문의 바랍니다."
                </li>
            </ul>
            </div>
        </div>
        <div class="item-review-container">
            <div class="description-header">
                <div>
                    <ul>
                        <a href="#check1" class=""><li>상품상세정보</li></a>
                        <a href="#check2" class=""><li>상품구매안내</li></a>
                        <a href="#check3" class=""><li style="background-color:#ccc; color:white;">구매후기</li></a>
                    </ul>
                </div>
            </div>
            <div class="review-header" style="text-align: center; margin-bottom: 25px; font-size: 25px;">
            	<a id="check3"></a>
                <h3>Reviews</h3>
            </div>
            <div class="review-item-container">
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
                <div>
                    <img src="" alt="" width="200" height="200">
                    <div></div>
                </div>
            </div>
            <div class="review-btn">
                	<button id="review-btn" class="btn btn-outline-success">후기등록</button>
            </div>
        </div>
    </div>
    <script>
   		const review = document.querySelector("#review-btn");
       	
       	review.addEventListener('click',()=>{
       		open("<%=request.getContextPath()%>/product/review_write.jsp","_blank","width=800px,height=500px")
       	})
       	
       	const value = $("#product-order-amount");
       	const price = $(".total-price>span>strong"); 
       	const oriPrice = $('.price').prop("id");
       	var num = Number(value.val());
       	$("#btn-r").click(function(){
       		if(num<=99){
   				num = num+1;
   				value.val(num);
   				price.html(oriPrice*num);
   			/* console.log(num); */
       		}else{
       			alert("주문 가능 최대 갯수는 99개 입니다.");
       		}

       	})
       	$("#btn-l").click(function(){
       		if(num>1){
	   			num = num-1;
	   			value.val(num);
   				price.html(parseInt(price.html())-oriPrice);
	   			/* console.log(num); */
       		}else{
       			num = 1;
       		}

       	})
       	
       	$("#cart-btn").click(function(){
       		$(".modal").css("display","block").css("top","230px");
       	})
       	
       	$(".modal-footer>.btn:nth-child(1)").click(function(){
       		console.log("이벤트발생");
       		$(".modal").css("display","none");
       	})
       	
       	$(".modal-footer>.btn:nth-child(2)").click(function(){
       		console.log("이벤트발생");
       		$(".modal").css("display","none");
       		location.href='<%=request.getContextPath()%>/views/cart/cartList.jsp?productNo=<%=p.getProductNo()%>';
       		/* ajax or get-> queryString방식으로 product# 넘기기 ,  */
       	})
       	
       	// 23/11/17 02:00 수정 필요
	       	<%-- const select = $("#option-select");
       		const option = $("<option></option>");
       	<%if(p.getProductOptionStatus().equals("Y")){%>
       		console.log("<%=p.getProductOptionStatus()%>");
	       	<%for(int i=0; i<p.getProductOption().size(); i++){ %>
	       		console.log(<%=p.getProductOption().get(i).getProductOptionPrice()%>)
	       		option.val(<%=p.getProductOption().get(i).getProductOptionPrice()%>);
	       		option.html("<%=p.getProductOption().get(i).getProductOptionName()%>(<%=p.getProductOption().get(i).getProductOptionPrice()%>원)");
	       		$(select).append(option);
	      	<%} %>    	
      	<%} %> --%>
    </script>
<%@ include file="/views/footer.jsp" %>