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
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href ="#" class="btn btn-danger btn-removeAll">비우기</a>
						<a href ="#" class="btn btn-danger btn-removeSel">선택 삭제</a>
						<a href ="./shippingInfo.jsp" class="btn btn-success">주문</a>
					</td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<form name="frmRemoveCartSel" method="post"> <!-- 체크박스 값 보내기 위한 form  -->
			<input type="hidden" name="productId">
				<table class="table table-hover">
					<tr>
						<td>선택</td>
						<td>사진</td>
						<td>상품</td>
						<td>가격</td>
						<td>수량</td>
						<td>소계</td>
						<td>비고</td>
					</tr>
				<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String memberId = (String) session.getAttribute("sessionMemberId");
				int totalPrice = 0;
				
				try{
					String sql = "SELECT * FROM cart c INNER JOIN product p ON c.productId = p.productId where orderId = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, orderId);
					rs = pstmt.executeQuery();
					
					while (rs.next()){
						
						String productId = rs.getString("productId");
						String fileName = rs.getString("fileName");
						String productName = rs.getString("productName");
						int unitPrice = rs.getInt("unitPrice");
						int cnt = rs.getInt("cnt");
						int price = unitPrice * cnt;
						totalPrice += price;
							
				%>
					<tr>
						<td><input type="checkbox" name="checkedId" value="<%=productId %>"></td>
						<td><img src="/upload/<%=fileName%>" style="width:100px">
						<td><a href="../product/product.jsp?productId=<%=productId %>"><%=productName %></a></td>
						<td><%=unitPrice %></td>
						<td><%=cnt%></td>
						<td><%=price %></td>
						<td><a href="#" role="<%=productId%>"class="badge badge-danger btn-removeById">삭제</a></td>
					</tr>
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
					<tr>
						<td colspan="7">합계 : <%=totalPrice %>원
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function(){
			const removeBtn = document.querySelector('.btn-removeAll');
			const removeSelBtn = document.querySelector('.btn-removeSel');
			const btnRemoveByIds = document.querySelectorAll('.btn-removeById');
			const frmCart = document.querySelector('form[name=frmRemoveCartSel]');
			
			removeBtn.addEventListener('click', function(){
				let confirmText = confirm("정말 장바구니를 비우시겠습니까?");
				if(confirmText==true){
					location.href = "./processRemoveCart.jsp"
				}
			})
			removeSelBtn.addEventListener('click', function(){
				const checked = document.querySelectorAll('input[name="checkedId"]:checked');
				if(checked.length == 0){ // 선택한 값이 없으면
					alert("삭제 할 목록을 1개 이상 선택해주세요");
					return;
				}
				let confirmText = confirm("정말 삭제하시겠습니까?");
				if(confirmText==true){
					frmCart.action = './processRemoveCartSelected.jsp';
					frmCart.submit();
				}
			})
			
			btnRemoveByIds.forEach(button => {
				button.addEventListener('click', function(e) {
					if(confirm('정말 삭제하시겠습니까?')){
						frmCart.productId.value = e.target.role;
						frmCart.action = '../order/processRemoveCartById.jsp';
						frmCart.submit();
					}
				})
			})
		})
	
	</script>
	<jsp:include page="../inc/footer.jsp"/>
</body>
</html>