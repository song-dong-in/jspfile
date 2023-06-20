<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Product"%>
<%@ page import="user.ProductRepository"%>
<jsp:useBean id="productDAO" class="user.ProductRepository" scope="session" />



<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="product.css">

<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		//확인 : true, 취소 : false
		if (confirm("상품을 장바구니에 추가하겠습니까?")) { //확인
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	
	

	<div class="jumbotron">
		<div class="container_p">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>

	<%
	//넘어온 상품 아이디값을 얻음
	String id = request.getParameter("id");
	ProductRepository dao = ProductRepository.getInstance();
	Product product = productDAO.getProductById(id);
	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h2><%=product.getPname()%></h2>
				<p><%=product.getDescription()%>
				<h4><%=product.getUnitPrice()%>원
				</h4>
				<p>
				<form name="addForm" method="post"
					action="addcart.jsp?id=${product.productId}">
					<a href="#" class="btn btn-info" > 상품주문&raquo;</a> 
					<a href="#" class="btn btn-warning" onclick="addToCart()"> 장바구니&raquo;</a>
				    <a href="bottom.jsp" class="btn btn-secondary">상품목록&raquo;</a>
				</form>
				</p>
			</div>
		</div>
		<hr>
	</div>



</body>
</html>