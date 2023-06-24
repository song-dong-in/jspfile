<%@ page language="java" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>


<%
    Connection conn = null;

	try{
    String url = "jdbc:mysql://localhost:3306/WebMarketDB";
    String user = "root";
    String passwd = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, passwd);
    }catch(SQLException ex){
    	out.println("데이터베이스 연결 실패");
    	out.println("SQLException:"+ex.getMessage());
    }
%>