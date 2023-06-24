<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@page import="user.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	
	String id = "P1234";

	// 아이디가 없으면
	if(id == null || id.trim().equals("")){
		// product.jsp로 되돌아간다.
		response.sendRedirect("product1.jsp");
		// 프로그램 종료
		return;
	}

	// 상품 저장소 객체 생성
	ProductRepository dao = ProductRepository.getInstance();
	Product product = dao.getProductById(id);

	// 상품 아이디에 해당하는 정보를 얻어와보자
	if (id.equals("P1234")) {
		product = dao.getPhone();
	} else if (id.equals("P1235")) {
		product = dao.getNotebook();
	} else if (id.equals("P1236")) {
		product = dao.getTablet();
	}

	// id의 값이 P9999 이런 경우 상품이 없다.
	if(product == null){
		response.sendRedirect("/exceptionNoProductId.jsp");
		return;
	}

	// 요청 파라미터 아이디의 상품을 담은 장바구니를 초기화
	// 세션: cartlist를 얻어와 ArrayList로 저장
	ArrayList<Product> cart = (ArrayList<Product>) session.getAttribute("cartlist");
	out.print("cart의 크기: " + (cart != null ? cart.size() : 0));
	// 만약 cartlist라는 세션 정보가 없다면 ArrayList를 생성하고 cartlist 세션 생성
	if(cart == null){
		cart = new ArrayList<Product>();
		session.setAttribute("cartlist", cart);
	}

	// 장바구니에 이미 담긴 상품인지 검사
	boolean productExistsInCart = false;
	for (Product cartProduct : cart) {
		if (cartProduct.getProductId().equals(id)) {
			// 요청 파라미터 아이디 addCart.jsp?id=P1234의 상품이 장바구니에 이미 담겨있다면 해당 상품의 수량을 1증가
			int orderQuantity = cartProduct.getQuantity() + 1;
			cartProduct.setQuantity(orderQuantity);
			productExistsInCart = true;
			break;
		}
	}

	if (!productExistsInCart) {
		// 요청 파라미터 아이디의 상품이 장바구니에 없다면 해당 상품을 추가
		product.setQuantity(1);
		cart.add(product);
	}

	response.sendRedirect("product1.jsp?id=" + id);
%>
