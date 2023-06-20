<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@page import="user.ProductRepository"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();
	
	Cookie[] cookies = request.getCookies();
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	// 쿠키가 있어야 함 
	if(cookies != null){
	   for(int i=0; i<cookies.length;i++){
	      Cookie thisCookie = cookies[i];
	      // 쿠키명을 가져오기
	      String n = thisCookie.getName();
	      // 쿠키명에 매핑되어 있는 값을 가져오기
	      if(n.equals("Shipping_cartId")){
	         shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      if(n.equals("Shipping_name")){
	         shipping_name = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      if(n.equals("Shipping_shippingDate")){
	         shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      if(n.equals("Shipping_country")){
	         shipping_country = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      if(n.equals("Shipping_zipCode")){
	         shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      if(n.equals("Shipping_addressName")){
	         shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
	      }
	      
	      
	   }
	}
%>
 
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	<!-- 배송에 관한 정보 시작 -->
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br>
				성명 : <%=shipping_name%> <br>
				우편번호 : <%=shipping_zipCode%> <br>
				주소 : <%=shipping_addressName%>(<%=shipping_country%>)<br>
			</div>
			<div class="col-4" align="right">
				<p><em>배송일 : <%=shipping_shippingDate %></em></p>
			</div>
		</div>
	<!-- 배송에 관한 정보 끝 -->
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품</th>
					<th class="text-center">가격</th>
				</tr>
				<% List<Product> cartList = (List<Product>)session.getAttribute("cartlist"); %>
				<% int sum = 0; %>
				<% for (Product product : cartList) { %>
					<tr>
						<td class="text-center"><em><%= product.getPname() %></em></td>
						<td class="text-center"><%= product.getQuantity() %></td>
						<td class="text-center"><%= product.getUnitPrice() %>원</td>
						<td class="text-center"><%= product.getQuantity() * product.getUnitPrice() %>원</td>
					</tr>
					<% sum += product.getQuantity() * product.getUnitPrice(); %>
				<% } %>
				<tr>
					<td></td>
					<td></td>
					<td><strong>총액 :</strong></td>
					<td class="text-center text-danger"><strong><%= sum %>원</strong></td>
				</tr>
			</table>
				<a href="shippingInfo.jsp?cartId=<%= cartId %>" class="btn btn-secondary" role="button">이전</a>
				<a href="thankCustomer.jsp" class="btn btn-success">주문완료</a>
				<a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>

		</div>
	</div>
</body>
</html>
