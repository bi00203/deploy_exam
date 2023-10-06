<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 등록</title>
</head>
<body>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<%@ include file="../inc/dbconn.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String productId = request.getParameter("productId");
		
		/* Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
		Long stock = unitsInStock.isEmpty() ? 0L : Long.parseLong(unitsInStock); */
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			
			String sql = "select * from product where productId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,productId);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
	%>
	<div class="container">
		<form name="frmProduct" action="./processModifyProduct.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control" value="<%=rs.getString("productId") %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품 명</label>
				<div class="col-sm-3">
					<input type="text" name="productName" class="form-control" value="<%=rs.getString("productName") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" value="<%=rs.getInt("unitPrice") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세 정보</label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" rows="2"><%=rs.getString("description") %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("manufacturer") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control" value="<%=rs.getString("category") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" class="form-control" value="<%=rs.getLong("unitsInStock") %>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상태</label>
				<div class="col-sm-3">
					<input type="text" name="conditionTemp" value="<%=rs.getString("condition") %>" hidden>
					<input type="radio" name="condition" value="New"> 신규 제품
					<input type="radio" name="condition" value="Old"> 중고 제품
					<input type="radio" name="condition" value="Refurbished"> 재생 제품
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-3">
					<input type="file" name="fileName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
			</div>
		</form>
	</div>
<%
		}
%>
	<jsp:include page="../inc/footer.jsp"/>
<script>
	document.addEventListener('DOMContentLoaded', function(){
		
		const radioInputs = document.querySelectorAll('input[name=condition]');
		const checkedValue = document.querySelector('input[name=conditionTemp]').value;
		for(let i = 0; i < radioInputs.length; i++){
			if(radioInputs[i].value === checkedValue)
				radioInputs[i].checked = true;
		}
	})
</script>
</body>
</html>