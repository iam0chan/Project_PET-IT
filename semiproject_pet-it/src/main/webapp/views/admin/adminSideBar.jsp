<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Bootstrap link -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
 <!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
 <!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
</style>
   
</head>
<body>
<!-- sidebar start -->    
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      	<div class="logo">
      	<img src="<%=request.getContextPath()%>/img/petit_logo_bk.png" width="150" height="50">
      	<p><b>관리자 페이지</b></p>
        </div>
      <div class="position-sticky pt-3">
      		<p>
	            <a class="nav-link active" aria-current="page" href="#">
	              <span data-feather="home"></span>
	              PetIt 메인페이지로
	            </a>
            </p>
          <div class="accordion accordion-flush" id="nav-accor-fl">
          	<div class="accordion-item">
          		<h2 class="accordion-header" id="flush-headingOne">
          			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne" style="background-color:#F2F2F2">
          			<span data-feather="shopping-cart"></span>
          			&nbsp&nbsp 상품관리
          			</button>
          		</h2>
          		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#nav-accor-fl">
      				<div class="accordion-body">
        				<p><a href="">상품등록</a></p>
        				<p><a href="">상품수정</a></p>
        				<p><a href="">상품삭제</a></p>
				    </div>
			   	</div>
          	</div>
          	<div class="accordion-item">
          		<h2 class="accordion-header" id="accorMember">
          			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#f-accorMember" aria-expanded="true" aria-controls="f-accorMember" style="background-color:#F2F2F2">
          			<span data-feather="users"></span>
          			&nbsp&nbsp 회원관리
          			</button>
          		</h2>
          		<div id="f-accorMember" class="accordion-collapse collapse" aria-labelledby="accorMember" data-bs-parent="nav-accor-fl">
      				<div class="accordion-body">
        				<p><a href="">회원정보관리</a></p>
        				<p><a href="">후기관리</a></p>
        				<p><a href="">쿠폰관리</a></p>
        				<p><a href="">적립금관리</a></p>
				    </div>
			   	</div>
          	</div>
          	<div class="accordion-item">
          		<h2 class="accordion-header" id="accorOrder">
          			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#f-accorOrder" aria-expanded="true" aria-controls="#f-accorOrder" style="background-color:#F2F2F2">
          			<span data-feather="layers"></span>
          			&nbsp&nbsp 주문관리
          			</button>
          		</h2>
          		<div id="f-accorOrder" class="accordion-collapse collapse" aria-labelledby="accorOrder" data-bs-parent="nav-accor-fl">
      				<div class="accordion-body">
        				<p><a href="">주문 관리</a></p>
        				<p><a href="">반품/환불 관리</a></p>
        				<p><a href="">배송 관리</a></p>
				    </div>
			   	</div>
          	</div>
          	<div class="accordion-item">
          		<h2 class="accordion-header" id="accorBoard">
          			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#f-accorBoard" aria-expanded="true" aria-controls="#f-accorBoard" style="background-color:#F2F2F2">
          			<span data-feather="file-text"></span>
          			&nbsp&nbsp 게시판관리
          			</button>
          		</h2>
          		<div id="f-accorBoard" class="accordion-collapse collapse" aria-labelledby="accorBoard" data-bs-parent="nav-accor-fl">
      				<div class="accordion-body">
        				<p><a href="">공지사항 관리</a></p>
        				<p><a href="">이벤트 관리</a></p>
				    </div>
			   	</div>
          	</div>
          </div>
      </div>
    </nav>
<!-- sidebar end --> 