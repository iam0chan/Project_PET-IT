<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat, java.sql.*, java.util.*, com.pet.payment.model.dto.Order"%>
<% List<Order> order = (List<Order>) request.getAttribute("orders"); %>
<%@ include file="adminSideBar.jsp" %>

<title>Pet-It 관리자페이지</title>

<style>

	td {
	  /* border: 1px solid #333; */
	  border-collapse: collapse;
	  text-align : center;
	  justfy-content : center;
	}
	table {
	  margin-left : 40px; 
	  margin: 40px;
	  border-collapse: collapse;
	  text-align : center;
	}
	td,
	th {
	  padding: 3px;
	  vertical-align : middle;
	}
	thead,
	tfoot {
	  background-color: #43AF82;
	  color: #fff;
	}
	th {
		text-align : center;
	}
	td.center {
	  text-align: center;
	  cursor: pointer;
	  
	}

	div.btnArea {
	  margin: 20px;
	  text-align : center;
	}
	#title {
		margin-top : 50px;
		text-align : center;
	}
	
	tbody{
		font-size:0.8rem;
	}
	
	input[type=checkbox] {

	zoom: 1.3;
	
	}
	
	.btnEditDel{
		font-size:0.8rem;
	}
	
	#tableContainer{
		text-align : center;
		display : flax;
		item-aligns : center;
		justfy-content : center;
	}
	li{
		color:black;
		
	}
</style>

<link rel="icon" href="<%=request.getContextPath()%>/img/favicon-16x16.png" type="image/png" />
<!-- content start --> 
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h3>주문 관리 페이지</h3> 
      </div>  	
    <h3 id="title"> 주문 목록 </h3>
    <div class="btnArea">
      	<button type="button" id="btnRefresh" class="btn btn-outline-success">주문목록 새로고침</button>
        <button type="button" id="btnDelete" class="btn btn-outline-success">선택주문 일괄취소/환불</button>
      </div>

      <!-- 테이블 -->
      <div id="tableContainer">
      <table class="table table-hover">
        <caption></caption>
        <colgroup>
          <col width="3%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="5%" />
          <col width="20%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
        </colgroup>
        <thead>
          <tr>
            <th><input type="checkbox" name="" id="chkRowAll"></th>
            <th>주문번호</th>
            <th>ID</th>
            <th>주문자명</th>
            <th>연락처</th>
            <th>배송지 주소</th>
            <th>총 가격</th>
            <th>주문 수정/취소</th>
          </tr>
        </thead>
        
        <tbody>
     <% if(!order.isEmpty()){ %>
        <% for(Order o : order){%>
        		
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="orderNo"><%=o.getOrderNo()%></td>
            <td class="center" data-cell-header="content"><%=o.getOrderId()%></td>
            <td class="center" data-cell-header="content"><%=o.getOrderName()%></td>
            <td class="center" data-cell-header="content"><%=o.getOrderPhone()%></td>
            <td class="center" data-cell-header="content"><%=o.getOrderZipcode()%> <%=o.getOrderAddr()%> <%=o.getOrderDefAddr()%></td>
            <td class="center" data-cell-header="content"><%=o.getOrderTotalPrice()%></td>
            <td class="center" data-cell-header="btnEditDel"><button class="btn btn-outline-success btnEditDel">주문 수정/취소</button></td>   
          </tr>
          
        <%} %>  
    <%} %>    
        </tbody>
      </table>
	 </div>

      <!-- pageBar / 버튼 -->
	 <div id="pageBar">
     	<%=request.getAttribute("pageBar") %>
     </div>    
      
      
<form id="myForm" action="/submit" method="post">

<!-- Sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>       
<script type="text/javascript">
	$(document).ready(function(){
		init();
	});
</script>
<script>
    function init() {
    	  
    	  //일괄 삭제 버튼 클릭
    	  $('#btnDelete').click(function() {
    	    // 체크된 항목 확인
    	    var arrOrderNo = [];
    	    $('input[name="chkRow"]:checked').each(function(idx, item) {
    	    	arrOrderNo.push(
    	        $(this).closest('tr').find('td').filter(function() {
    	          return $(this).data('cellHeader') == 'orderNo';
    	        }).text()
    	      );
    	    });

    	    if (arrOrderNo.length == 0) {
    	    	Swal.fire({
    	    		  icon: "error",
    	    		  title: "이런...",
    	    		  text: "주문이 선택되지 않았어요!",
    	    		});
    	      return;
    	    } else {
    	    	Swal.fire({
    	    		  title: "주문 일괄 삭제/환불",
    	    		  text: "선택 주문들을 정말 환불하고 삭제합니까?",
    	    		  icon: "warning",
    	    		  showCancelButton: true,
    	    		  confirmButtonColor: "#3085d6",
    	    		  cancelButtonColor: "#d33",
    	    		  confirmButtonText: "Delete"
    	    		}).then((result) => {
    	    		  	if (result.isConfirmed) {
	    	    		    $.ajax({
	    	    		    	url : '<%=request.getContextPath()%>/adminOrderDelete',
	    	    		    	type : 'POST',
	    	    		    	dataType : 'json',
	    	    		    	data : { 
	    	    		    		arrOrderNo: JSON.stringify(arrOrderNo) 
	   	    		    		},
	   	    		    		success :(data)=>{
	   	    		    			location.reload();
	   	    		    		}
	    	    		    });
		    	    			Swal.fire({
		    	    		      title: "삭제 되었습니다!",
		    	    		      text: "선택된 주문들이 환불되고 삭제되었습니다",
		    	    		      icon: "success"
		    	    		    });
		    	    			location.reload();
    	    		  	}
    	    		});
   	    		 }
    	 	 });

    	}
    
	 <!----------------버튼클릭 이벤트-------------------->
	 	
	 	//새로고침 버튼
		  $('#btnRefresh').click(function(){
			  location.reload();
		  });
			 
	 	// 개별 주문수정/취소 버튼  
 		 $(document).ready(function() {
 			  // 버튼 클릭 이벤트 처리
 			  $('table').on('click', 'tr td button', function() {
 				//클릭한 행을 제외한 나머지 체크박스 해제  
 				 $(this).closest('tr').siblings().find('input[type="checkbox"]').prop('checked', false);
 			    // 버튼이 위치한 행의 주문번호 td를 선택하여 데이터 가져오기
 			    var orderNo = $(this).closest('tr').find('td:nth-child(2)').text();

	 			   Swal.fire({
	 	    		  title: "주문 수정/취소",
	 	    		  text: "상세페이지로 이동할까요?",
	 	    		  icon: "warning",
	 	    		  showCancelButton: true,
	 	    		  confirmButtonColor: "#3085d6",
	 	    		  cancelButtonColor: "#d33",
	 	    		  confirmButtonText: "Yes"
	 	    		}).then((result) => {
	 	    			if (result.isConfirmed) {	    				
 	    					location.href='<%=request.getContextPath()%>/adminOrderView.do?orderNo='+orderNo;
    	    		    }
					});
 			 	 });
 			}); 
	 	 
		  
	<!----------------체크박스 관리-------------------->  
 		/**
   	   * 체크박스는 Header의 ID와 Body의 NAME을 아래의 형식으로 맞춰줘야 정상적으로 동작합니다.
   	   * Ex) Header's id="chkRowAll", Body's name="chkRow"
   	   */
   	  // Header에 있는 체크박스 변경시
   	  $(document).on('change', 'input[id$="All"]:checkbox', function() {
   	    fncCheckAll($(this).attr('id'));
   	  });

   	  // 모두 체크된 경우 Header 체크박스를 변경
   	  $(document).on('change', 'input:checkbox', function() {
   	    var chgId = $(this).attr('id') || '';
   	    var chgNm = $(this).attr('name') || '';

   	    // 다른 Checkbox에 영향이 가지 않도록 id 와 name 값이 'chk'로 시작하는 Checkbox만 대상으로 함
   	    if (chgId.indexOf('chk') == -1 && chgNm.indexOf('chk') == -1) return;

   	    // id 와 name 값이 모두 없는 경우 제외
   	    if (isNullStr(chgId) && isNullStr(chgNm)) return;

   	    // Header(ID가 '%All'로 끝나는)에 있는 CheckBox인 경우는 제외
   	    if (chgId.indexOf('All') > -1) return;

   	    var totLen = $('input[name=' + chgNm + ']').length;
   	    var chkLen = $('input[name=' + chgNm + ']:checked').length;

   	    // 목록에 있는 CheckBox가 모두 체크된 경우 Header도 체크되도록 설정
   	    if (totLen == chkLen) {
   	      $('#' + chgNm + 'All').prop('checked', true);
   	    } else {
   	      $('#' + chgNm + 'All').prop('checked', false);
   	    }
   	  });
   	  
   	  // 행 어디를 선택해도 맨 앞의 checkbox선택
   	  $('td').click(function(event) {
   		    if (!$(event.target).is('input[type="checkbox"]')) {
   		        var checkbox = $(this).closest('tr').find('input[type="checkbox"]');
   		        checkbox.prop('checked', !checkbox.prop('checked'));
   		    }
   		});

   		$('input[type="checkbox"]').click(function(event) {
   		    event.stopPropagation();
   		});
		  	    	
	
    	/**
    	 * 체크박스 전체 체크/해제
    	 * Ex) Header's id="chkRowAll", Body's name="chkRow"
    	 * @param {string} id
    	 */
    	function fncCheckAll(id) {
    	  var targetNm = id.replace('All', '');
    	  if ($('#' + id).is(':checked')) {
    	    $('input[name=' + targetNm + ']').each(function() {
    	      $(this).prop('checked', true);
    	    });
    	  } else {
    	    $('input[name=' + targetNm + ']').each(function() {
    	      $(this).prop('checked', false);
    	    });
    	  }
    	}

    	/**
    	 * String 값이 비어 있는 값인지 확인
    	 * @param {string} str
    	 */
    	function isNullStr(str) {
    	  str = $.trim(str);
    	  if (str == null || str == 'undefined' || str.length == 0 || typeof str == 'undefined' || str == '') {
    	    return true;
    	  } else {
    	    return false;
    	  }
    	}
</script>