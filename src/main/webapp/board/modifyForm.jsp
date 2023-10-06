<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.example.mvc.model.dto.BoardDTO"%>
<%
  BoardDTO board = (BoardDTO) request.getAttribute("board");
  String sessionMemberId = (String) session.getAttribute("sessionMemberId");
  if (sessionMemberId == null) {
    response.sendRedirect("../member/loginMember.jsp");
  }
  else if(!sessionMemberId.equals(board.getMemberId())){
    response.sendRedirect("/");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <meta charset="utf-8">
  <title>Board</title>
</head>
<body>
<jsp:include page="/inc/menu.jsp" />
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">게시판</h1>
  </div>
</div>
<div class="container">
  <form name="frmModify" action="./boardAddAction.do" method="post" class="form-horizontal">
    <input name="id" type="hidden" class="form-control" value="<%=board.getNum()%>">
    <div class="form-group row">
      <label class="col-sm-2 control-label" >이름</label>
      <div class="col-sm-3">
        <input name="name" type="text" class="form-control" value="<%=board.getName()%>" placeholder="name">
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 control-label">제목</label>
      <div class="col-sm-5">
        <input name="subject" type="text" class="form-control" placeholder="subject" value="<%=board.getSubject()%>">
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-2 control-label">내용</label>
      <div class="col-sm-8">
        <textarea name="content" cols="50" rows="5" class="form-control" placeholder="content"><%=board.getContent()%></textarea>
      </div>
    </div>
    <div class="form-group row">
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class="btn btn-primary btn-submit" value=" 수정 ">
        <input type="reset" class="btn btn-primary" value=" 취소 ">
      </div>
    </div>
  </form>
  <hr>
</div>
<jsp:include page="../inc/footer.jsp" />
<script>
  document.addEventListener('DOMContentLoaded', function () {
    const btnSubmit = document.querySelector('.btn-submit');
    const frmModify = document.querySelector('form[name=frmModify]');

    btnSubmit.addEventListener('click', function () {
      if (!frmModify.name.value) {
        alert("이름을 입력하세요.");
        return;
      }
      if (!frmModify.subject.value) {
        alert("제목을 입력하세요.");
        return;
      }
      if (!frmModify.content.value) {
        alert("내용을 입력하세요.");
        return;
      }
      frmModify.submit();
    });
  });
</script>
</body>
</html>