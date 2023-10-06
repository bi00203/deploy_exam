<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
  request.setCharacterEncoding("UTF-8");
  String pw = request.getParameter("pw");
  String pwRe = request.getParameter("pw-re");

%>
<%

  if(pw.equals(pwRe)){
    out.print("{\"result\":\"true\"}");
  } else {
    out.print("{\"result\":\"false\"}");
  }
%>