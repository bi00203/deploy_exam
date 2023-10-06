<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		int maxAge = 24 * 60 * 60;
		
		session.setAttribute("orderId",request.getParameter("orderId"));
		session.setAttribute("orderName",request.getParameter("orderName"));
		session.setAttribute("tel",request.getParameter("tel"));
		session.setAttribute("zipCode",request.getParameter("zipCode"));
		session.setAttribute("address01",request.getParameter("address01"));
		session.setAttribute("address02",request.getParameter("address02"));
		
		session.setMaxInactiveInterval(maxAge);
		/* Cookie orderId = new Cookie("orderId", URLEncoder.encode(request.getParameter("orderId"),encoding));
		Cookie orderName = new Cookie("orderName", URLEncoder.encode(request.getParameter("orderName"),encoding));
		Cookie tel = new Cookie("tel", URLEncoder.encode(request.getParameter("tel"),encoding));
		Cookie zipCode = new Cookie("zipCode", URLEncoder.encode(request.getParameter("zipCode"),encoding));
		Cookie address01 = new Cookie("address01", URLEncoder.encode(request.getParameter("address01"),encoding));
		Cookie address02 = new Cookie("address02", URLEncoder.encode(request.getParameter("address02"),encoding));
		
		
		orderId.setMaxAge(maxAge);
		orderName.setMaxAge(maxAge);
		tel.setMaxAge(maxAge);
		zipCode.setMaxAge(maxAge);
		address01.setMaxAge(maxAge);
		address02.setMaxAge(maxAge);
		
		response.addCookie(orderId);
		response.addCookie(orderName);
		response.addCookie(tel);
		response.addCookie(zipCode);
		response.addCookie(address01);
		response.addCookie(address02); */
		
		response.sendRedirect("orderConfirm.jsp");
		
	
	%>
</body>
</html>