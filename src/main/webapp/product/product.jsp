<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/exception/exceptionNoProduct.jsp" %>
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
			<h1 class="display-3">상품정보</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String productId = request.getParameter("productId");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			
			String sql = "select * from product where productId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
			String fileName = rs.getString("fileName");
			String productName = rs.getString("productName");
			String description = rs.getString("description");
			String manufacturer = rs.getString("manufacturer");
			String category = rs.getString("category");
			Long unitsInStock = rs.getLong("unitsInStock");
			Integer unitPrice = rs.getInt("unitPrice");
	%>
	
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-6">
				<img src="/upload/<%=fileName%>" style="width:100%">
				<h3><%=productName%></h3>
				<p><%=description%></p>
				<p><strong>상품 코드</strong> : <span class="badge badge-danger">
					<%=productId %>
				</span></p>
				<p><strong>제조사</strong> : <%=manufacturer %></p>
				<p><strong>분류</strong> : <%=category%></p>
				<p><strong>재고 수</strong> : <%=unitsInStock %></p>
				<p><%=unitPrice%>원</p>
				
				<form name="frmAddCart" action="../order/processAddCart.jsp" method="post">
					<input type="hidden" name="productId" value="<%=productId%>">
				</form>
				<%
			}
				%>
				
				<p>
					<a href="#" class="btn btn-info"> 장바구니 담기 >> </a>
					<a href="../order/cart.jsp" class="btn btn-info"> 장바구니 목록 >> </a>
					<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 >> </a>
				</p>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			const btnCart = document.querySelector('.btn-info');
			const frmAddCart = document.querySelector('form[name=frmAddCart]');
			
			
			btnCart.addEventListener('click', function() {
				frmAddCart.submit();				
			})
		})
	
	</script>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>