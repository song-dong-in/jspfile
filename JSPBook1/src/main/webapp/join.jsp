<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	 <div class="join_container">
        <h2>
            회원 가입
        </h2>
        <form method="post" action="./join_Action.jsp">
            <h3>아이디</h3>
            <div class="joinID">
                <input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="userID" title="아이디" maxlength="20">
            </div>
            <h3>비밀번호</h3>
            <div class="joinPassword">
                <input type="password" class="input" placeholder="비밀번호" name="userPassword" title="비밀번호" maxlength="20">
            </div>
            <h3>이름</h3>
            <div class="joinName">
                <input type="text" class="input" placeholder="이름" name="userName" title="이름" maxlength="20">
            </div>
            <h3>생년월일</h3>
            <div class="joinDate">
                <input type="date" class="input" placeholder="생년월일" name="userDate">
            </div>
            <h3>성별</h3>
            <div class="joinGender">
                <input type="radio" name="userGender" value="M" title="성별"> 남자
                <input type="radio" name="userGender" value="F" title="성별"> 여자
            </div>
            <input type="submit" class="bt_join" value="회원가입">
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