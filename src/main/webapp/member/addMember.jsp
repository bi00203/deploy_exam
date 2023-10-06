<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="frmMember" action="./processAddMember.jsp" method="post">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="memberId" class="form-control">
					<span class="memberIdCheck"></span>
					<br><input type="button" name="btnIsDuplication" value="팝업 아이디 중복 확인">
					<br><input type="button" name="btnIsDuplication2nd" value="ajax 아이디 중복 확인">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="text" name="passwd" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="text" name="passwd-re" class="form-control">
					<span class="passwdCheck"></span>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="memberName" class="form-control">
				</div>
			</div>
			<div class="form-group  row">
			<label class="col-sm-2">성별</label>
			<div class="col-sm-10">
				<input name="gender" type="radio" value="남"> 남
				<input name="gender" type="radio" value="여"> 여
			</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4">
					<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" class="form-control" style="display:inline-block; width: 30%;">
					<select name="birthmm" style="width: 20%;">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 
					<input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" class="form-control" style="display:inline-block; width: 20%;">
				</div>
			</div>
			<div class="form-group  row ">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input type="text" name="mail1" maxlength="50" class="form-control" style="display:inline-block; width: 15%;" >@
					<select name="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phone01" class="form-control" style="display:inline-block; width: 20%;"> -
					<input type="text" name="phone02" class="form-control" style="display:inline-block; width: 30%;"> -
					<input type="text" name="phone03" class="form-control" style="display:inline-block; width: 30%;">
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
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address01" id="address01" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상세주소</label>
				<div class="col-sm-3">
					<input type="text" name="address02" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
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
			const xhr = new XMLHttpRequest();
			const findZipCodeBtn = document.querySelector('.btn-zipCode');
			const frmMember = document.frmMember;
			const inputId = document.querySelector('input[name=memberId]');
			const inputPwRe = document.querySelector('input[name=passwd-re]');
			
			const btnIsDuplication = document.querySelector('input[name=btnIsDuplication]');
			const btnIsDuplication2nd = document.querySelector('input[name=btnIsDuplication2nd]');
			
			btnIsDuplication.addEventListener('click', function () { // 아이디 팝업 체크
				const memberId = frmMember.memberId.value;
				if (memberId === ""){
					alert('아이디를 입력해 주세요.');
					frmMember.memberId.focus();
					return;
				}
				
				window.open('popupIdCheck.jsp?id=' + memberId, 'idCheck', 'width = 500, height = 500, top = 100, left = 200, location = no');
			});
			
			btnIsDuplication2nd.addEventListener('click', function () { // 아이디 팝업 체크 ajax
				
				const memberId = frmMember.memberId.value;
				xhr.open('GET', 'ajaxIdCheck.jsp?id=' + memberId);
				xhr.send();
				
				xhr.onreadystatechange = () => {
					if (xhr.readyState !== XMLHttpRequest.DONE) return;
					
					if (xhr.status === 200){
						const json = JSON.parse(xhr.response);
						if (json.result === 'true'){
							alert('동일한 아이디가 있습니다.');
						}
						else {
							alert('동일한 아이디가 없습니다.');
						}
					}
					else { // 서버(rul)에 문서가 존재하지 않음
						console.error('Error', xhr.status, xhr.statusText);
					}
				}
			});
			
			inputId.addEventListener('keyup', function (){
				const id = frmMember.memberId.value;
				const memberIdCheck = document.querySelector('.memberIdCheck');
				xhr.open('GET', 'ajaxIdCheck.jsp?id=' + id);
				xhr.send();
				
				xhr.onreadystatechange = () => {
					if (xhr.readyState !== XMLHttpRequest.DONE) return;
					
					if (xhr.status === 200){
						const json = JSON.parse(xhr.response);
						if (json.result === 'true'){
							memberIdCheck.style.color = 'red';
							memberIdCheck.innerHTML ='동일한 아이디가 있습니다.';
						}
						else {
							memberIdCheck.style.color = 'gray';
							memberIdCheck.innerHTML ='동일한 아이디가 없습니다.';
						}
					}
					else { // 서버(rul)에 문서가 존재하지 않음
						console.error('Error', xhr.status, xhr.statusText);
					}
				}
			});

			inputPwRe.addEventListener('keyup', function (){
				const pw = frmMember.passwd.value;
				const pwRe = inputPwRe.value;
				const passwdReCheck = document.querySelector('.passwdCheck');
				xhr.open('GET', 'ajaxPwReCheck.jsp?pw=' + pw + '&pw-re=' + pwRe);
				xhr.send();

				xhr.onreadystatechange = () => {
					if (xhr.readyState !== XMLHttpRequest.DONE) return;

					if (xhr.status === 200){
						const json = JSON.parse(xhr.response);
						if (json.result === 'true'){
							passwdReCheck.style.color = 'gray';
							passwdReCheck.innerHTML ='비밀번호가 동일합니다';
						}
						else {
							passwdReCheck.style.color = 'red';
							passwdReCheck.innerHTML ='동일한 비밀번호를 입력해주세요';
						}
					}
					else { // 서버(rul)에 문서가 존재하지 않음
						console.error('Error', xhr.status, xhr.statusText);
					}
				}
			});
			
			findZipCodeBtn.addEventListener('click', function(){ // 우편번호 검색
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