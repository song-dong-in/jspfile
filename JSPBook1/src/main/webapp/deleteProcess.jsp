<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>

<%
String filename = "";
String realFolder = "C:\\upload"; //웹 어플리케이션상의 절대 경로
String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		new DefaultFileRenamePolicy());
String productId = multi.getParameter("productId");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String selectSql = "SELECT * FROM product WHERE p_id = ?";
    pstmt = conn.prepareStatement(selectSql);
    pstmt.setString(1, productId);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        String deleteSql = "DELETE FROM product WHERE p_id = ?";
        pstmt = conn.prepareStatement(deleteSql);
        pstmt.setString(1, productId);
        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            response.sendRedirect("bottom2.jsp");
        } else {
            out.println("상품 삭제 실패");
        }
    } else {
        out.println("일치하는 상품이 없습니다");
    }
} catch (SQLException e) {
    out.println("상품 삭제 중 오류 발생: " + e.getMessage());
} finally {
    if (rs != null) {
        try {
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
