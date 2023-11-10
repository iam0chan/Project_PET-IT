<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- Bootstrap link -->
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/dashboard/">
	<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
<link href="../css/dashboard.css" rel="stylesheet">

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
      	<img src="../img/petit_logo_bk.png" width="150" height="50">
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

<!-- content start --> 
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">일일 매출 통계</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>Section title</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
              <th scope="col">Header</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1,001</td>
              <td>random</td>
              <td>data</td>
              <td>placeholder</td>
              <td>text</td>
            </tr>
            <tr>
              <td>1,002</td>
              <td>placeholder</td>
              <td>irrelevant</td>
              <td>visual</td>
              <td>layout</td>
            </tr>
            <tr>
              <td>1,003</td>
              <td>data</td>
              <td>rich</td>
              <td>dashboard</td>
              <td>tabular</td>
            </tr>
            <tr>
              <td>1,003</td>
              <td>information</td>
              <td>placeholder</td>
              <td>illustrative</td>
              <td>data</td>
            </tr>
            <tr>
              <td>1,004</td>
              <td>text</td>
              <td>random</td>
              <td>layout</td>
              <td>dashboard</td>
            </tr>
            <tr>
              <td>1,005</td>
              <td>dashboard</td>
              <td>irrelevant</td>
              <td>text</td>
              <td>placeholder</td>
            </tr>
            <tr>
              <td>1,006</td>
              <td>dashboard</td>
              <td>illustrative</td>
              <td>rich</td>
              <td>data</td>
            </tr>
            <tr>
              <td>1,007</td>
              <td>placeholder</td>
              <td>tabular</td>
              <td>information</td>
              <td>irrelevant</td>
            </tr>
            <tr>
              <td>1,008</td>
              <td>random</td>
              <td>data</td>
              <td>placeholder</td>
              <td>text</td>
            </tr>
            <tr>
              <td>1,009</td>
              <td>placeholder</td>
              <td>irrelevant</td>
              <td>visual</td>
              <td>layout</td>
            </tr>
            <tr>
              <td>1,010</td>
              <td>data</td>
              <td>rich</td>
              <td>dashboard</td>
              <td>tabular</td>
            </tr>
            <tr>
              <td>1,011</td>
              <td>information</td>
              <td>placeholder</td>
              <td>illustrative</td>
              <td>data</td>
            </tr>
            <tr>
              <td>1,012</td>
              <td>text</td>
              <td>placeholder</td>
              <td>layout</td>
              <td>dashboard</td>
            </tr>
            <tr>
              <td>1,013</td>
              <td>dashboard</td>
              <td>irrelevant</td>
              <td>text</td>
              <td>visual</td>
            </tr>
            <tr>
              <td>1,014</td>
              <td>dashboard</td>
              <td>illustrative</td>
              <td>rich</td>
              <td>data</td>
            </tr>
            <tr>
              <td>1,015</td>
              <td>random</td>
              <td>tabular</td>
              <td>information</td>
              <td>text</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>
<!-- content end --> 

	<!-- JS sources -->
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="../js/dashboard.js"></script>
</body>
