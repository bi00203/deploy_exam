<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
<%
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String sql = "SELECT * FROM member WHERE memberId=?";
	
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, id);
	resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
		out.print("{\"result\":\"true\"}");
	} else {
		out.print("{\"result\":\"false\"}");
	}
	if(preparedStatement != null){
		preparedStatement.close();
	}
	if(conn != null){
		conn.close();
	}

%>