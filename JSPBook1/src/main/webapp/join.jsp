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
            ȸ�� ����
        </h2>
        <form method="post" action="./join_Action.jsp">
            <h3>���̵�</h3>
            <div class="joinID">
                <input type="text" class="input" style="ime-mode:disabled;" placeholder="���̵�" name="userID" title="���̵�" maxlength="20">
            </div>
            <h3>��й�ȣ</h3>
            <div class="joinPassword">
                <input type="password" class="input" placeholder="��й�ȣ" name="userPassword" title="��й�ȣ" maxlength="20">
            </div>
            <h3>�̸�</h3>
            <div class="joinName">
                <input type="text" class="input" placeholder="�̸�" name="userName" title="�̸�" maxlength="20">
            </div>
            <h3>�������</h3>
            <div class="joinDate">
                <input type="date" class="input" placeholder="�������" name="userDate">
            </div>
            <h3>����</h3>
            <div class="joinGender">
                <input type="radio" name="userGender" value="M" title="����"> ����
                <input type="radio" name="userGender" value="F" title="����"> ����
            </div>
            <input type="submit" class="bt_join" value="ȸ������">
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