<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="user.ProductRepository" %>
<jsp:useBean id="productDAO" class="user.ProductRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<link rel="stylesheet" href="ShoppingMain.css">
<link rel="stylesheet" href="bottom.css">


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>



	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="login.jsp">�α���</a></li>
			</ul>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="join.jsp">ȸ������</a></li>

					<li class="nav-item"><a class="nav-link" href="cart.jsp">��ٱ���</a></li>
					<li class="nav-item"><a class="nav-link" href="#">����������</a></li>


				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="#">
		<div class="row text-center">

			<hr1 />

			<a class="blog-header-logo text-body-emphasis text-decoration-none "
				href="#"><font size="7">�ʴ���</font></a>
		</div>
	</div>

	<hr />

	<div class="text-center">

		<button class='no_outline_btn'>
			<font size="5"></font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">�ƿ���</font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">����</font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">��Ʈ</font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">����</font>
		</button>
		<button class='no_outline_btn' onclick="location.href='bottom.jsp'">
			<font size="2">����</font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">�Ź�</font>
		</button>
		<button class='no_outline_btn'>
			<font size="2">�Ǽ��縮</font>
		</button>

	</div>

	<div style="width: auto; border: 0;">
		<h1>&nbsp</h1>
	</div>
	
	
	

	<h4 align="center">����</h4>
	
	

	<div class="container">
		<div class="text-center">
			<button class='no_outline_btn'>
				<font size="2">������</font>
			</button>
			<button class='no_outline_btn'>
				<font size="2">����</font>
			</button>
			<button class='no_outline_btn'>
				<font size="2">Ʈ���̴�</font>
			</button>

		</div>
	</div>


	<div class="container_bottom">
		<div class="row">
			<%
			ProductRepository productRepository = new ProductRepository();
		    Product phone = productRepository.getPhone();
		    Product notebook = productRepository.getNotebook();
		    Product tablet = productRepository.getTablet();
			%> 
			
			<div class="col">
				<div class="card" style="width: 20rem;">
					<img src="bottom1.PNG" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">�����̵� ���̵� ���� ������</h5>
						<p class="card-text">ĳ����ϰ� �巹���� �ϱ⿡ ���� Ư���� ������ <br><br> 47,900��</p>
						<a href="./product.jsp?id=<%=phone.getProductId() %>"  class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			
			
			<div class="col">
				<div class="card" style="width: 20rem;">
					<img src="bottom2.PNG" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">302 �� ���� ���̵� ����</h5>
						<p class="card-text">���ϰ� �ÿ��� ���� ����! ���� �ʼ�ǰ~<br><br><br> 42,900��</p>
						<a href="./product.jsp?id=<%=notebook.getProductId() %>" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width: 20rem;">
					<img src="bottom3.PNG" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">���Ǹ� ���̿��̵� �޸� ����</h5>
						<p class="card-text">Ʈ���̴��������� ���Ǹ� ��� ������ ������ ����Ƽ�� �������<br><br>44,900��</p>
						<a href="./product.jsp?id=<%=tablet.getProductId() %>" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>