<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	String sessionMemberId = (String) session.getAttribute("sessionMemberId");
	
	String sql = "delete from cart where memberId = ?";
	preparedStatement = conn.prepareStatement(sql);
	preparedStatement.setString(1, sessionMemberId);
	preparedStatement.executeUpdate();
	
	session.invalidate();
	
	if(preparedStatement != null){
		preparedStatement.close();
	}
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("./resultMember.jsp");
%>