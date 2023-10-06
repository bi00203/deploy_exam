<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
				<p><a href="./modifyProduct.jsp?productId=<%=productId %>" class="btn btn-secondary" role="button">
				수정 >> </a>
				<a href="#" class="btn btn-danger btn-remove" role="button" id="<%=rs.getString("productId") %>">
				삭제 >> </a>
				</p>
				
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
	<script>
		document.addEventListener('DOMContentLoaded', function(){
			const btns = document.querySelectorAll('.btn-remove');
			btns.forEach(btn => {
				btn.addEventListener('click', function (e){
					if (confirm('해당 상품을 삭제 하시겠습니까?')){
						const productId = e.target.id;
						
						location.href = './processRemoveProduct.jsp?productId='+productId;
					}
				})
			})
		})
	
	</script>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>