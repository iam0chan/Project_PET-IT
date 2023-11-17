<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("main.jsp");
		return;
	}

	/* 코드 수정중->일단 주석해놓음 */
	/* ProductRepository dao = ProductRepository.getInstance();

	Product book = dao.getProductById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}

	ArrayList<Product> goodsList = dao.getAllProducts();
	Product product = new Product();
	for (int i = 0; i < goodsList.size(); i++) {
		product = goodsList.get(i);
		if (product.getBookID().equals(id)) { 			
			break;
		}
	}
	
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
	if (list == null) { 
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}

	int cnt = 0;
	Product goodsQnt = new Product();
	for (int i = 0; i < list.size(); i++) {
		productQnt = list.get(i);
		if (productQnt.getProductID().equals(id)) {
			cnt++;
			int orderQuantity = productQnt.getQuantity() + 1;
			productQnt.setQuantity(orderQuantity);
		}
	}

	if (cnt == 0) { 
		product.setQuantity(1);
		list.add(product);
	} */

	response.sendRedirect("productView.jsp?id=" + id);
%>