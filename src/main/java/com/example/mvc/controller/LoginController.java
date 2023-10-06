//package com.example.mvc.controller;
//
//import com.example.mvc.model.login.LoginBean;
//
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet(urlPatterns = {"*.do"})
//public class LoginController extends HttpServlet {
////	private static final long serialVersionUID = 1L;
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		/*
//		 1. request 받은 값 처리
//		 2. 모델 클래스에 값 저장 후 로그인 인증 여부 확인
//		 3. 인증 여부에 따라 다른 페이지 이동
//		 */
//		resp.setContentType("text/html; charset=utf-8");
//
//		String id = req.getParameter("id");
//		String password = req.getParameter("passwd");
//
//		LoginBean bean = new LoginBean();
//		bean.setId(id);
//		bean.setPassword(password);
//		req.setAttribute("bean", bean);
//
//		boolean status = bean.validate();
//		System.out.println(status);
//		if (status) {
//			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_success.jsp");
//			dispatcher.forward(req, resp);
//		}
//		else {
//			RequestDispatcher dispatcher = req.getRequestDispatcher("mvc_error.jsp");
//			dispatcher.forward(req, resp);
//		}
//	}
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//	}
//
//
//
//
//
//}
