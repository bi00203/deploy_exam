<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../inc/dbconn.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		
		
		String productId = request.getParameter("productId");
		if(productId == null || productId.trim().equals("")){
			response.sendRedirect("../product/products.jsp");
			return;
		}
		
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		String sql = "select num from cart where (orderId=?) and (productId=?)";
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, orderId);
		preparedStatement.setString(2, productId);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
			sql = "UPDATE cart SET cnt = cnt + 1 WHERE num=?";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, resultSet.getInt("num"));
			preparedStatement.executeUpdate();
		}
		else{
			String memberId = (String) session.getAttribute("sessionMemberId");
			memberId = (memberId == null) ? "Guest" : memberId;
			
			int cnt = 1;
			sql = "INSERT INTO cart (orderId, memberId, productId, cnt, addDate)" +
				"VALUES (?, ?, ?, ?, now())";
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, orderId);
			preparedStatement.setString(2, memberId);
			preparedStatement.setString(3, productId);
			preparedStatement.setInt(4, cnt);
			preparedStatement.executeUpdate();
			
		}
		
		if(preparedStatement != null){
			preparedStatement.close();
		}
		if(conn != null){
			conn.close();
		}
		
		//response.sendRedirect("../product/products.jsp");
	
	%>
	<script>
		document.addEventListener('DOMContentLoaded',function(){
			if(confirm('상품을 담았습니다. 장바구니를 확인하시겠습니까?')){
				location.href = './cart.jsp';
			}
			else{
				location.href = '../product/products.jsp';
			}
		})
	</script>
</body>
</html>