<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<link rel="stylesheet" href="ShoppingMain.css">

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
					<li class="nav-item"><a class="nav-link" href="admin_login.jsp">������</a></li>


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
		<button class='no_outline_btn'><font size="2">�ƿ���</font></button>
		<button class='no_outline_btn'><font size="2">����</font></button>
		<button class='no_outline_btn'><font size="2">��Ʈ</font></button>
		<button class='no_outline_btn'><font size="2">����</font></button>
		<button class='no_outline_btn' onclick="location.href='bottom.jsp'"><font size="2">����</font></button>
		<button class='no_outline_btn'><font size="2">�Ź�</font></button>
		<button class='no_outline_btn'><font size="2">�Ǽ��縮</font></button>
		
		<hr>
		<img src="mainImage.PNG">
		
	</div>
	
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>