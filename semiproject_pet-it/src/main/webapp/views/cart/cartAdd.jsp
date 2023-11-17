<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	//id가 없거나 값이 없을 때
	if(id==null||id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	
	//상품저장소 객체 생성
	ProductDao dao = ProductDao.getInstance();
	
	//상품 아이디에 해당하는 정보를 얻어와보자
	Product product = dao.getProductById(id);
	//id의 값이 P999 이런 경우 상품이 없다 
	if(product == null){
		response.sendRedirect("/.jsp");
	}
	//모든 상품을 가져와보자
	List<Product> goodsList = dao.getAllProducts();
	Product goods = new Product();
	for(int i=0; i<goodsList.size();i++){
		//요청 파라미터 아이디의 상품이 존재하는지 검사
		goods = goodsList.get(i);
		//A.equals(id)
		if(goods.getProductId().equals(id)){
			//for문에서 벗어나라
			break;
		}
	}
	
	//*요청 파라미터 아이디의 상품을 담은 장바구니를 초기화
	//세션 : cartlist를 얻어와  Array 객체에 저장
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	out.print("list의 크기 : " + list);
	//만약 cartlist라는 세션 정보가 없다면 ArrayList 객체를 생성하고 cartlist세션 생성
	if(list == null){
		list = new ArrayList<Product>();
		session.setAttribute("cartlist", list);
	}
	//list : 장바구니에 담긴 상품 목록
	int cnt = 0;
	Product goodsQnt = new Product();
	for(int i=0; i<list.size();i++){
		//요청 파라미터 아이디 addCart.jsp?id=P1234의 상품이 장바구니에 담긴 목록에 있다면
		//해당 상품의 수량을 1 증가
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	//요청 파라미터 아이디 cartAdd.jsp?id=P1234의 상품이 장바구니에 담긴 목록에 없다면
	//해당 상품의 수량을 1로 처리
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("product.jsp?id=" + id);
%>