<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body>
	<%@ include file="../inc/dbconn.jsp"%>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 수정</h1>
		</div>
	</div>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String sessionMemberId = (String) session.getAttribute("sessionMemberId");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			
		String sql = "select * from member where memberId = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,sessionMemberId);
		rs = pstmt.executeQuery();
			
		if (rs.next()){
			String passwd = rs.getString("passwd");
			String memberName = rs.getString("memberName");
			String gender = rs.getString("gender");
			String birthday = rs.getString("birthday");
			String[] birthdayArr = birthday.split("-");
			String birthyy = birthdayArr[0];
			String birthmm = birthdayArr[1];
			String birthdd = birthdayArr[2];
			
			String email = rs.getString("email");
			String[] emailArr = email.split("@");
			
			String phone = rs.getString("phone");
			String[] phoneArr = phone.split("-");
			
			String zipCode = rs.getString("zipCode");
			String address01 = rs.getString("address01");
			String address02 = rs.getString("address02");
	%>
	<div class="container">
		<form name="frmMember" action="./processModifyMember.jsp" method="post">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="memberId" class="form-control" value="<%=sessionMemberId %>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" name="passwd" class="form-control" value="<%=passwd%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="text" name="passwd-re" class="form-control" value="<%=passwd%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="memberName" class="form-control" value="<%=memberName%>">
				</div>
			</div>
			<div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-10">
				<input name="gender" type="radio" value="남" <%if(gender.equals("남")) out.print("checked"); %>> 남
				<input name="gender" type="radio" value="여" <%if(gender.equals("여")) out.print("checked"); %>> 여
			</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4">
					<input type="text" name="birthyy" value="<%=birthyy%>" maxlength="4" placeholder="년(4자)" size="6" class="form-control" style="display:inline-block; width: 30%;">
					<select name="birthmm" value="<%=birthmm%>" style="width: 20%;">
						<option value="">월</option>
						<%
							for (int i = 1; i <= 12; i++){
								String month = String.format("%02d", i);
								out.print("<option value=\"" + month + "\"");
								if (birthmm.equals(month)){
									out.print(" selected");
								}
								out.print(">" + i + "</option>");
							}
						%>
					</select> 
					<input type="text" name="birthdd" value="<%=birthdd%>" maxlength="2" placeholder="일" size="4" class="form-control" style="display:inline-block; width: 20%;">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" value="<%=emailArr[0]%>" maxlength="50" class="form-control" style="display:inline-block; width: 15%;" >@
					<select name="mail2">
					<%
						String[] mails = {"naver.com", "daum.net", "gmail.com", "nate.com"};
							for (int i = 0; i <= 3; i++){
								out.print("<option value=\"" + mails[i] + "\"");
								if (emailArr[1].equals(mails[i])){
									out.print(" selected");
								}
								out.print(">" + mails[i] + "</option>");
							}
					%>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phone01" value="<%=phoneArr[0]%>" class="form-control" style="display:inline-block; width: 20%;"> -
					<input type="text" name="phone02" value="<%=phoneArr[1]%>" class="form-control" style="display:inline-block; width: 30%;"> -
					<input type="text" name="phone03" value="<%=phoneArr[2]%>" class="form-control" style="display:inline-block; width: 30%;">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" value="<%=zipCode%>" id="zipCode" class="form-control" readonly>
					<input type="button" class="btn btn-primary btn-zipCode" value="우편번호 찾기">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address01" value="<%=address01%>" id="address01" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세주소</label>
				<div class="col-sm-3">
					<input type="text" name="address02" value="<%=address02%>" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정">
					<a href="processRemoveMember.jsp" class="btn btn-primary">회원탈퇴</a>
				</div>
			</div>
		</form>
	</div>
	<%
		}
	%>
	
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