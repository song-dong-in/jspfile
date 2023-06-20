<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.UserDAO" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userDate"/>
<jsp:setProperty name="user" property="userGender"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP BBS</title>
</head>
<body>
    <%
    	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || 
    			user.getUserDate() == null|| user.getUserGender() == null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
    	}else{
    		UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if (result == -1){ // 회원가입 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 회원가입 성공시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'login.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    	}
    %>
 
</body>
</html>