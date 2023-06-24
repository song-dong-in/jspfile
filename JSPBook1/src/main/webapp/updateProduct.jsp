<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">    
	<title>상품 수정</title>
</head>
<body>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">상품 수정</h1>
        </div>
    </div>
    <%@ include file="dbconn.jsp"%>
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
                    <form name="updateProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label class="col-sm-2">상품 코드</label>
                            <div class="col-sm-3">
                                <input type="text" name="productId" class="form-control" value="<%= hasProduct ? rs.getString("p_id") : "" %>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2">상품명</label>
                            <div class="col-sm-3">
                                <input type="text" name="name" class="form-control" value="<%= hasProduct ? rs.getString("name") : "" %>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2">가격</label>
                            <div class="col-sm-3">
                                <input type="text" name="unitPrice" class="form-control" value="<%= hasProduct ? rs.getInt("price") : "" %>">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2">상세 정보</label>
                            <div class="col-sm-3">
                                <textarea name="description" cols="50" rows="2"><%= hasProduct ? rs.getString("description") : "" %></textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2">상품 이미지</label>
                            <div>
                                <input type="file" name="productImage" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class="btn btn-primary" value="수정">
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
