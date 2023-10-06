package dao;

import com.example.mvc.model.dao.BoardDAO;
import com.example.mvc.model.dto.BoardDTO;
import org.junit.jupiter.api.Test;

public class BoardTests {
    @Test
    public void testBoardInsert() {
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = new BoardDTO();
        for(int i = 4; i < 104; i++) {
            boardDTO.setMemberId("user01");
            boardDTO.setSubject("제목" + i);
            boardDTO.setContent("내용" + i);
            boardDTO.setName("작성자" + i);
            boardDTO.setHit(1);
            boardDTO.setAddDate("2020-01-01");
            boardDAO.insertBoard(boardDTO);
        }

    }

    @Test
    public void testGetBoardByNum() {
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = boardDAO.getBoardByNum(1);
        System.out.println(boardDTO.toString());

    }

    @Test
    public void testUpdateBoard() {
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardDTO boardDTO = new BoardDTO();
        boardDTO.setSubject("수정된제목1");
        boardDTO.setContent("수정된내용");
        boardDTO.setName("수정된작성자");
        boardDTO.setNum(1);
        boardDAO.updateBoard(boardDTO);

    }
}
