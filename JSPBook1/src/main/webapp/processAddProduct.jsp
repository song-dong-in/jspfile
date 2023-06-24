<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Product" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="user.ProductRepository" %>
<%@ include file="dbconn.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");

	String filename ="";
	//이미지 삽입할땐 c:\\upload 코드로 변경
	String realFolder="images/";
	//변경 하고 images/로 코드 변경
	
	int maxsize = 100*1024*1024;
	String encType="UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, encType, new DefaultFileRenamePolicy());
	
	//addproduct.jsp 에서 사용자가 입력한 부분 받아서 저장

    String productId = multi.getParameter("productId");
    String name = multi.getParameter("name");
    String unitPrice = multi.getParameter("unitPrice");
    String description = multi.getParameter("description");

    Integer price;

    if (unitPrice == null || unitPrice.isEmpty()) {
        price = 0;
    } else {
        price = Integer.valueOf(unitPrice);
    }

    
    Enumeration files = multi.getFileNames();
    String fname = (String)files.nextElement();
    String fileName = multi.getFilesystemName(fname);


        
        // 데이터베이스에 파일 이름을 저장합니다.
		 
        
        try{

        PreparedStatement pstmt = null;
        
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/WebMarketDB", "root", "1234");

            String sql = "insert into product values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            pstmt.setString(2, name);
            pstmt.setInt(3, price);
            pstmt.setString(4, description);
            pstmt.setString(5, fileName);
            
            pstmt.executeUpdate();
       
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
      
    response.sendRedirect("bottom2.jsp");
%>