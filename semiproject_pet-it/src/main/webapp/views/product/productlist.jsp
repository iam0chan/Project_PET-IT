<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pet.product.model.dto.Product, java.util.List, com.pet.product.model.dto.ProductImageFile"%>
    
<%@ include file="/views/header.jsp"%>
<%  List<Product> products = (List<Product>)request.getAttribute("products"); 
    StringBuilder pageBar = (StringBuilder)request.getAttribute("pageBar");
    List<ProductImageFile> files = (List<ProductImageFile>)request.getAttribute("files");
    String type = (String)request.getAttribute("type");
    String productNo = "";
    String no="";
%>
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
                	<input type="hidden" id="type" value="<%=type%>">
                	<button name="type-btn" id="all" type="button" class="btn btn-outline-success" style="width:auto;">전체보기</button>
                    <button name="type-btn" id="new" type="button" class="btn btn-outline-success" style="width:auto;">신상품</button>
                    <button name="type-btn" id="T-1"type="button" class="btn btn-outline-success" style="width:auto;">Dog 사료</button>
                    <button name="type-btn" id="T-2" type="button" class="btn btn-outline-success" style="width:auto;">Dog 간식</button>
                    <button name="type-btn" id="T-3" type="button" class="btn btn-outline-success" style="width:auto;">Dog 용품</button>
                </div>
            </div>
        </div>
        <div class="item-container">
            <!-- <div class="sort-list">
                <p>인기상품</p>
                <p>조회순</p>
                <p>신상품</p>
                <p>금액오름차순</p>
                <p>금액내림차순</p>
            </div> -->
            <div class="container">
            <%if(products!=null && !products.isEmpty()){ %>
               <%for(Product p : products){ %>
               <%if(p.getProductEnrollStatus().equals("Y")){ %>
                   <div class="card" id=<%=p.getProductNo()%>>
                       <div class="item-img">
                       <%if(files!=null && !files.isEmpty()){ %>
                          <%for(ProductImageFile f : files){ %>
                             <%if(p.getProductNo().equals(f.getProductNo())){ %>
                             <img src="<%=request.getContextPath()%>/upload/<%=f.getProductFileRename()%>"/>
                             <%} %>
                          <%} %>
                       <%} %>
                       </div>
                       <div class="item-content" style="line-height:1.5;">
                          <span style="font-size:17.5px; font-weight: bolder; margin-top:10px;"><%= p.getProductName()%></span>
                          <span style="font-size:13px; margin-bottom:-5px;"><%= p.getProductInfo() %></span>
                          <%if(p.getProductDiscount().equals("0")){ %>
                          	<span style="margin-top:15px;"><%= p.getProductPrice() %>원</span>
                          <%}else{ %>
                          	<span style="margin-top:15px; text-decoration:line-through;"><%= p.getProductPrice() %>원 </span><b style="font-size:20px;"><%=(int)(p.getProductPrice()*(1.0-Double.parseDouble(p.getProductDiscount())))%>원</b><span style="font-weight:bold; color:red;">SALE <%=(int)(Double.parseDouble(p.getProductDiscount())*100)%>%</span>
                          <%} %>
                          <%-- <input id="productNo" style="display:none" value="<%=p.getProductNo()%>"> --%>
                       </div>
                   </div>
                   </a>
                   <%} %>
             <%} %>
          <%}else{  %>
          <div style="width:100%; text-align:center;">
             <h3>조회된 상품 결과가 존재하지 않습니다.</h3>
          </div>
          <%} %>
            </div>
            <%if(products!=null && !products.isEmpty()){ %> 
            <div style="margin-bottom:25px;">
            
               <%=pageBar%>
            </div>
              <%} %>
            <div class="bottom-container">
                <div class="search-bar">
                   <form class="d-flex" action="<%=request.getContextPath()%>/product/productSearch.do" method="get" onsubmit="return lengthcheck();">
                      <input class="form-control me-2" name="keyword" id="search" placeholder="상품검색" aria-label="Search">
                      <button type="submit" class="btn btn-outline-success" id="search-btn"><i class="fa-solid fa-magnifying-glass search-icon"></i></button>
                    </form>
                </div>
                <div class="btn-bottom-container">
                <a class="admin-btn"href="<%=request.getContextPath()%>/product/productEnroll.do" style="color:#28A745;">
                    <%if(loginMember!=null && loginMember.getMemberId().equals("petitad")){ %>
                    <button type="button" class="btn btn-outline-success button-bottom">
                       상품등록
                    </button></a>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <script>
    
    $(document).ready(function(){
    	const type = $("#type").val();
    	
    	switch(type){
    	case "all":
    		$("#all").css("background-color","#28A745").css("color","white");
    		break;
    	case "new":
    		$("#new").css("background-color","#28A745").css("color","white");
    		break;
    	case "T-1" : 
    		$("#T-1").css("background-color","#28A745").css("color","white");
    		break;
    	case "T-2" :
    		$("#T-2").css("background-color","#28A745").css("color","white");
    		break;
    	case "T-3" :
    		$("#T-3").css("background-color","#28A745").css("color","white");
    		break;
    	}
    })
    const lengthcheck = function(){
    	const value = $("#search").val();
    	if(value.length>=1){
    		return true;
    	}
    	alert("검색어를 입력하세요!");
    	return false;
    }
    
    $(".admin-btn").mouseenter(function(){
      $(this).css("color","white");
   })   
   $(".admin-btn").mouseleave(function(){
      $(this).css("color","#28A745");
   })
 
   $(".card").mouseenter(function(){
      $(this).css("cursor","pointer");
      $(this).css("border","2px solid #28A745")
      $(this).click(function(){
         const productNo = $(this).prop("id");
         console.log(productNo);
         location.href='<%=request.getContextPath()%>/product/productview.do?productNo='+productNo;   
      })
   })
   
   $(".card").mouseout(function(){
      $(this).css("border","1px solid #dbdbd9");
   });    
    
    $("button[name=type-btn]").click(function(){
		const type = $(this).prop("id");
		location.href='<%=request.getContextPath()%>/productList.do?type='+type;
	})
    </script>
    
<%@ include file="/views/footer.jsp"%>