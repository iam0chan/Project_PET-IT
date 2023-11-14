<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/productview.css"/>
    <div class="wrapper">
        <div class="item-info-container">
            <div class="item-image">
                <div>
                    <img src="https://naturalcore.co.kr/web/product/small/202109/472c0fefa2afeba6b907c34cd2884faa.jpg" width="300px"
                        height="300px">
                </div>
                <div class="summary">
                    <span>상품설명란?</span>
                </div>
            </div>
            <div class="item-info">
                <div class="info item-title">
                    <h1>노을이가 좋아하는 간식</h1>
                    <p>구름이가 질투할만한 노을이 간식</p>
                </div>
                <div class="info item-price-info">
                    <h3>10,900원(할인가 9,900원)</h3>
                </div>
                <div class="info item-simple-description">
                    <sapn>
                    	어찌합니까~~~
                    	어떻게할까요~~~
                    </sapn>
                </div>
              
                <div class="info item-option">
                    <div class="option" style="width: 300px;">
                        <select name="priceOption" id="option" style="width:280px;">
                            <option value="1">간식 500g</option>
                            <option value="2">간식 200g(-2000원)</option>
                            <option value="3">간식 800g(+2000원)</option>
                        </select>
                    </div>
                    <div class="amountbtn">
                        <button style="width: 20px;">-</button>
                        <input type="text" value="1" style="text-align: right; width: 30px;" max="99">
                        <button style="width: 20px;">+</button>
                    </div>
                </div>
                <div class="info total-price"><span>총 금액 <strong>10,900원</strong></span></div>
                <div class="info button-container">
                    <button class="btn btn-outline-success">구매하기</button>
                    <button class="btn btn-outline-success">장바구니</button>
                </div>
            </div>
        </div>
        <div class="item-description-container">
            <div class="description-header">
                <div>
                    <ul>
                        <a href="#check1" class=""><li>상품상세정보</li></a>
                        <a href="#check2" class=""><li>상품구매안내</li></a>
                        <a href="#check3" class=""><li>구매후기</li></a>
                    </ul>
                </div>
            </div>
            <a id="check1"></a>
            <div class="item-description">
                <img src="https://naturalcore.co.kr/detail/dog/feed/mystew_dv.jpg" alt="">
            </div>
        </div>
        <div class="item-instruction">
            <div class="description-header">
                <div>
                   <ul>
                        <a href="#check1" class=""><li>상품상세정보</li></a>
                        <a href="#check2" class=""><li>상품구매안내</li></a>
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
                        <a href="#check3" class=""><li>구매후기</li></a>
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
    
    </script>
<%@ include file="/views/footer.jsp" %>