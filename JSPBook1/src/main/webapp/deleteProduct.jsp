<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 삭제</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">    
</head>
<body>
	 <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 삭제</h1>
        </div>
    </div>
    <%
        String productId = request.getParameter("id");

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "select * from product where p_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            rs = pstmt.executeQuery();
            boolean hasProduct = rs.next(); // 상품 정보가 있는지 확인
    %>
                <div class="container">
                    <form name="updateProduct" action="deleteProcess.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label class="col-sm-2">상품 코드</label>
                            <div class="col-sm-3">
                                <input type="text" name="productId" class="form-control" value="<%= hasProduct ? rs.getString("p_id") : "" %>">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-primary" value="삭제">
                            </div>
                        </div>
                    </form>
                </div>
                        
                         <%       
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        }
    %>
</body>
</html>