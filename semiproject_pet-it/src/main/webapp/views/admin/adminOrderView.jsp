<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat, java.sql.*, java.util.*, com.pet.payment.model.dto.OrderDetail"%>
<% OrderDetail od = (OrderDetail) request.getAttribute("orderDetail"); %>
<%@ include file="adminSideBar.jsp" %>

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
      
<section>
	<div class=contentContainer>
		<div class="input-group mb-3">
		  <span class="input-group-text" id="orderNo">주문번호</span>
		  <input type="text" class="form-control" placeholder="주문번호" aria-label="orderNo" aria-describedby="orderNo" disable>
		</div>
		
	</div>

</section>