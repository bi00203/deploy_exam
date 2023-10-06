<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp"%>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while (rs.next()){
						String fileName = rs.getString("fileName");
						String productName = rs.getString("productName");
						String description = rs.getString("description");
						String unitPrice = rs.getString("unitPrice");
						String productId = rs.getString("productId");
					
			%>
			<div class="col-md-4">
				<img src="/upload/<%=fileName%>" style="width:100%">
				<h3><%=productName%></h3>
				<p><%=description%></p>
				<p><%=unitPrice%>원</p>
				<p><a href="./product.jsp?productId=<%=productId %>" class="btn btn-secondary" role="button">
				상세정보 >> </a></p>
			</div>
			<%
					}
				} catch (SQLException ex){
					out.println("products 테이블 호출이 실패했습니다.<br>");
					out.println("SQLException: " + ex.getMessage());
				} finally {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				}
			%>
		</div>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>