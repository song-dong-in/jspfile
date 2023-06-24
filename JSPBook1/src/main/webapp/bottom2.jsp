<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="user.ProductRepository" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="productDAO" class="user.ProductRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

<link rel="stylesheet" href="ShoppingMain.css">
<link rel="stylesheet" href="bottom.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link" href="addproduct.jsp">상품등록</a></li>
				<li class="nav-item"><a class="nav-link" href="updateProduct.jsp">상품수정</a></li>
				<li class="nav-item"><a class="nav-link" href="deleteProduct.jsp">상품삭제</a></li>

			</ul>
			<form class="d-flex" role="search">
				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>

	<div class="#">
		<div class="row text-center">
			<hr />
			<a class="blog-header-logo text-body-emphasis text-decoration-none " href="#"><font size="7">옷덕방</font></a>
		</div>
	</div>

	<hr />

	<div class="text-center">
		<button class='no_outline_btn'>
			<font size="5"></font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">아우터</font>
			</button>
		<button class='no_outline_btn'>
			<font size="2">상의</font>
			</button>
		<button class='no_outline_btn'>
			<font size="2">니트</font>
			</button>
		<button class='no_outline_btn'>
			<font size="2">셔츠</font>
			</button>
		<button class='no_outline_btn' onclick="location.href='bottom.jsp'">
			<font size="2">바지</font>
			</button>
		<button class='no_outline_btn'>
			<font size="2">신발</font>
			</button>
		<button class='no_outline_btn'>
			<font size="2">악세사리</font>
			</button>
	</div>

	<div style="width: auto; border: 0;">
		<h1>&nbsp</h1>
	</div>

	<h4 align="center">바지</h4>

	<div class="container">
		<div class="text-center">
			<button class='no_outline_btn'>
				<font size="2">슬랙스</font>
			</button>
			<button class='no_outline_btn'>
				<font size="2">데님</font>
			</button>
			<button class='no_outline_btn'>
				<font size="2">트레이닝</font>
			</button>
		</div>
	</div>

	<div class="container_bottom">
		<div class="row">
			<%@include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				 <img src="images/<%=rs.getString("p_fileName") %>" style="width:70%">							
			 	<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><%=rs.getString("p_UnitPrice") %></p>
				<p>
					<a href="./product1.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-primary">Go somewhere</a>
					
				</p>
			</div>
			
			
			<%
				}
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			%>
		</div>
		<hr>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>
