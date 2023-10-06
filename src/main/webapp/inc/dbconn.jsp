<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	try {
		String url = "jdbc:mariadb://localhost:3308/market";
		String user = "root";
		String password = "7061";
		
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch (SQLException ex){
		out.println("데이터베이스 연결이 실패되었습니다.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
%>
<%
	String orderId = (String) session.getAttribute("orderId");
	
	if (orderId == null){
		String sessionId = session.getId();
		java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String currentDateTime = simpleDateFormat.format(new java.util.Date());
		orderId = currentDateTime + "-" + sessionId;
		session.setAttribute("orderId", orderId);
	}
%>