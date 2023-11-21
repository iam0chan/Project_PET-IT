<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat, java.sql.*, java.util.*, com.pet.payment.model.dto.Order"%>
<% Order o = (Order) session.getAttribute("orders"); %>
<%@ include file="adminSideBar.jsp" %>   
<title>Pet-It 관리자페이지</title>

<style>
	* {
	  margin: 0;
	  padding: 0;
	}
	button {
	  padding: 5px 10px;
	  cursor: pointer;
	}
	button:hover {
	  background-color: lightgreen;
	}
	div.app {
	  margin-top:5%;	
	  width: 95%;
	  align-items:center;
	  text-align:center;
	}
	table,
	td {
	  /* border: 1px solid #333; */
	  border-collapse: collapse;
	  text-align : center;
	}
	table {
	  margin: 20px;
	}
	td,
	th {
	  padding: 3px;
	}
	thead,
	tfoot {
	  background-color: #333;
	  color: #fff;
	}
	th {
		text-align : center;
	}
	td.center {
	  text-align: center;
	  
	}
	div.btnArea {
	  margin: 20px;
	  text-align : center;
	}
	#title {
		text-align : center;
	}
	
	tbody{
		font-size:0.7rem;
	}
	
	input[type=checkbox] {

	zoom: 1.3;
	
	}
</style>

<link rel="icon" href="<%=request.getContextPath()%>/img/favicon-16x16.png" type="image/png" />
<!-- content start --> 
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h3>주문 관리 페이지</h3>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          </div>
        </div>
      </div>
      	
    <div class="app">
    <h3 id="title"> 주문 목록 </h3>

      <!-- 테이블 -->
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
            <th>주문일자</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="no">1</td>
            <td class="center" data-cell-header="id">test-1</td>
            <td data-cell-header="content">TEST1</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
           
          </tr>
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="no">2</td>
            <td class="center" data-cell-header="id">test-2</td>
            <td data-cell-header="content">TEST2</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            
          </tr>
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="no">3</td>
            <td class="center" data-cell-header="id">test-3</td>
            <td data-cell-header="content">TEST3</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            
          </tr>
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="no">4</td>
            <td class="center" data-cell-header="id">test-4</td>
            <td data-cell-header="content">TEST4</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            
          </tr>
          <tr>
            <td class="center"><input type="checkbox" name="chkRow" id=""></td>
            <td class="center" data-cell-header="no">5</td>
            <td class="center" data-cell-header="id">test-5</td>
            <td data-cell-header="content">TEST5</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
	 <div id="pageBar">
     	<%=request.getAttribute("pageBar") %>
     </div>    
      <!-- 버튼 -->
      <div class="btnArea">
      	<button type="button" id="btnEdit" class="btn btn-outline-success">선택 주문 수정</button>
        <button type="button" id="btnDelete" class="btn btn-outline-success">선택 주문 삭제</button>
      </div>
    </div>
	
    
<script type="text/javascript">
	$(document).ready(function(){
		init();
	});
</script>
<script>
    function init() {
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

    	  // 버튼 클릭 Event
    	  $('#btnDelete').click(function() {
    	    // 체크된 항목 확인
    	    var arrIds = [];
    	    $('input[name="chkRow"]:checked').each(function(idx, item) {
    	      arrIds.push(
    	        $(this).closest('tr').find('td').filter(function() {
    	          return $(this).data('cellHeader') == 'id';
    	        }).text()
    	      );
    	    });

    	    if (arrIds.length == 0) {
    	      alert('체크된 항목이 없습니다.');
    	      return;
    	    } else {
    	      alert(arrIds.join());
    	    }
    	  });
    	  
    	  $('#btnEdit').click(function() {
      	    // 체크된 항목 확인
      	    var arrIds = [];
      	    $('input[name="chkRow"]:checked').each(function(idx, item) {
      	      arrIds.push(
      	        $(this).closest('tr').find('td').filter(function() {
      	          return $(this).data('cellHeader') == 'id';
      	        }).text()
      	      );
      	    });

      	    if (arrIds.length == 0) {
      	      alert('체크된 항목이 없습니다.');
      	      return;
      	    } else {
      	      alert(arrIds.join());
      	    }
      	  });
    	  
    	}

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