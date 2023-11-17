<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pet.product.model.dto.Product, java.util.List, com.pet.product.model.dto.ProductImageFile"%>
<%@ include file="/views/header.jsp"%>
<%  List<Product> products = (List<Product>)request.getAttribute("products"); 
    StringBuilder pageBar = (StringBuilder)request.getAttribute("pageBar");
    List<ProductImageFile> files = (List<ProductImageFile>)request.getAttribute("files");
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
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>신상품</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 베스트</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 사료</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 간식</a></button>
                    <button type="button" class="btn btn-outline-success" style="width:auto;"><a>Dog 용품</a></button>
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
                       <div class="item-content">
                          <p style="font-size:1.1rem; font-weight: bold; margin-bottom:10px;"><%= p.getProductName()%></p>
                          <p style="font-size:0.8rem;"><%= p.getProductInfo() %></p>
                          <p><%= p.getProductPrice() %>원</p>
                          <%-- <input id="productNo" style="display:none" value="<%=p.getProductNo()%>"> --%>
                       </div>
                   </div>
                   </a>
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
                    <form class="d-flex">
                      <input class="form-control me-2" type="search" placeholder="상품검색" aria-label="Search">
                      <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass search-icon" style="width:50px;margin-top:5px"></i></button>
                    </form>
                </div>
                <div class="btn-bottom-container">
                <a class="admin-btn"href="<%=request.getContextPath()%>/product/productEnroll.do" style="color:#28A745;">
                    <button type="button" class="btn btn-outline-success button-bottom">
                       상품등록
                    </button></a>
                </div>
            </div>
        </div>
    </div>
    <script>
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
    </script>
    
<%@ include file="/views/footer.jsp"%>