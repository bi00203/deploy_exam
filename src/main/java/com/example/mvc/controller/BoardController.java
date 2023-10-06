package com.example.mvc.controller;

import com.example.mvc.service.BoardService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"*.do"})
public class BoardController extends HttpServlet {

    /*
		 1. request 받은 값 처리
		 2. 모델 클래스에 값 저장 후 로그인 인증 여부 확인
		 3. 인증 여부에 따라 다른 페이지 이동
	*/
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardService boardService = BoardService.getInstance();
        String RequestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = RequestURI.substring(contextPath.length());
        System.out.println("command : " + command);

        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        System.out.println(command);
        switch (command) {
            case "/boardController/boardList.do" -> { //등록된 글 목록 페이지 출력
                boardService.requestBoardList(req);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/board/list.jsp");
                requestDispatcher.forward(req, resp);
                break;
            }
            case "/boardController/boardAddForm.do" -> { // 글 등록 폼 출력
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("/board/addForm.jsp");
                requestDispatcher.forward(req, resp);
                break;
            }
            case "/boardController/boardAddAction.do" -> { // 글 등록
                boardService.addBoard(req);
                resp.sendRedirect("./boardList.do");
                break;
            }
            case "/boardController/boardView.do" -> { // 글 상세보기
                boardService.getBoardView(req);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/view.jsp");
                requestDispatcher.forward(req, resp);
                break;
            }
            case "/boardController/boardModifyForm.do" -> { // 글 수정 폼 출력
                boardService.getBoardView(req);
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("../board/modifyForm.jsp");
                requestDispatcher.forward(req, resp);
                break;
            }
            case "/boardController/boardModifyAction.do" -> { // 글 수정
                boardService.modifyBoard(req);
                resp.sendRedirect("./boardList.do");
                break;
            }
            case "/boardController/boardRemoveAction.do" -> { // 글 삭제
                boardService.removeBoard(req);
                resp.sendRedirect("./boardList.do");
                break;
            }
        }

    }


}
