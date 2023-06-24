<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

 <link rel="stylesheet" href="style_login.css">
 
 
 
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <div class="login_containers">
        <h2>
            로그인
        </h2>
        <form method="post" action="./adminlogin_Action.jsp">
            <h3>아이디</h3>
            <div class="loginID">
                <input type="text" class="input" placeholder="아이디" name="userID" maxlength="20">
            </div>
            <h3>비밀번호</h3>
            <div class="loginPassword">
                <input type="password" class="input" placeholder="비밀번호" name="userPassword" maxlength="20">
            </div>
            <input type="submit" class="bt_login" value="로그인">
        </form>
    </div>

    <footer>
        <div class="footer_container">
            <div class="footA">
               
            </div>
            <div class="footB">
            </div>
        </div>
    </footer>
</body>
</html>