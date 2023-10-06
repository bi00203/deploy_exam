package com.example.mvc.service;

import com.example.mvc.model.dao.BoardDAO;
import com.example.mvc.model.dto.BoardDTO;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public class BoardService {
    static final int LISTCOUNT = 5;

    private static BoardService instance;

    private BoardService() {

    }

    public static BoardService getInstance(){
        if(instance == null)
            instance = new BoardService();
        return instance;
    }

    public void requestBoardList(HttpServletRequest request){
        BoardDAO dao = BoardDAO.getInstance();
        List<BoardDTO> boardList;

        int pageNum = 1;
        int limit = LISTCOUNT;
        if(request.getParameter("pageNum") != null){
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        }

        String items = request.getParameter("items");
        String text = request.getParameter("text");

        int totalRecord = dao.getListCount(items, text);
        boardList = dao.getBoardList(pageNum, limit, items, text);

        int totalPage;
        if (totalRecord % limit == 0){
            totalPage = totalRecord/limit;
            Math.floor(totalPage);
        }
        else {
            totalPage = totalRecord / limit;
            Math.floor(totalPage);
            totalPage = totalPage + 1;
        }

        int startNum = totalRecord - (pageNum - 1) * limit;

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("totalPage", totalPage); // 전체 페이지
        request.setAttribute("totalRecord", totalRecord); // 전체 글 개수
        request.setAttribute("boardList", boardList);
        request.setAttribute("startNum", startNum);

    }

    public void addBoard(HttpServletRequest request){
        BoardDAO dao = BoardDAO.getInstance();
        HttpSession session = request.getSession();

        BoardDTO board = new BoardDTO();
        board.setMemberId((String) session.getAttribute("sessionMemberId"));
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        System.out.println(request.getParameter("name"));
        System.out.println(request.getParameter("subject"));
        System.out.println(request.getParameter("content"));

        board.setHit(0);
        board.setIp(request.getRemoteAddr());

        dao.insertBoard(board);

    }

    public void getBoardView(HttpServletRequest request){
        BoardDAO dao = BoardDAO.getInstance();
        int num = Integer.parseInt(request.getParameter("num"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        BoardDTO board = dao.getBoardByNum(num);
        System.out.println(board.toString());

        request.setAttribute("pageNum", pageNum);
        request.setAttribute("board", board);
    }

    public void modifyBoard(HttpServletRequest request){
        int num = Integer.parseInt(request.getParameter("num"));

        BoardDAO dao = BoardDAO.getInstance();

        BoardDTO board = new BoardDTO();
        board.setNum(num);
        board.setName(request.getParameter("name"));
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));

        dao.updateBoard(board);
    }

    public void removeBoard(HttpServletRequest request){
        int num = Integer.parseInt(request.getParameter("num"));
        BoardDAO dao = BoardDAO.getInstance();
        dao.deleteBoard(num);
    }
}
