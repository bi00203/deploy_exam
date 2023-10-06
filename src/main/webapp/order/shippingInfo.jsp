<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	
	<%
		// 세션 ID 가져오기
		String sessionId = session.getId();
	
		java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String currentDateTime = simpleDateFormat.format(new java.util.Date());
		
		String orderId = currentDateTime + "-" + sessionId;
		
	%>
	<div class="container">
		<form action="./processShippingInfo.jsp" method="post">
		<input type="hidden" name="orderId" value="<%=orderId %>">
			<div class="form-group row">
				<label class="col-sm-2">주문자 이름</label>
				<div class="col-sm-3">
					<input type="text" name="orderName" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">연락처</label>
				<div class="col-sm-3">
					<input type="text" name="tel" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" id="zipCode" class="form-control" readonly>
					<input type="button" class="btn btn-primary btn-zipCode" value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소 1</label>
				<div class="col-sm-3">
					<input type="text" name="address01" id="address01" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소 2</label>
				<div class="col-sm-3">
					<input type="text" name="address02" id="address02" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<a href="./cart.jsp" class="btn btn-secondary" role="button"> 이전 </a>
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="../inc/footer.jsp"/>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		document.addEventListener('DOMContentLoaded', function(){
			const findZipCodeBtn = document.querySelector('.btn-zipCode');
			findZipCodeBtn.addEventListener('click', function(){
				new daum.Postcode({
					oncomplete: function(data){
						document.getElementById( 'zipCode' ).value = data.zonecode;
			            document.getElementById( 'address01' ).value = data.address;
					}
				}).open();
			})
		})
	
</script>
</html>