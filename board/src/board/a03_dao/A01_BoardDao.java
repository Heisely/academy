package board.a03_dao;

// board.a03_dao.A01_BoardDao
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import board.z01_vo.Board;
import board.z01_vo.BoardFile;

@Repository
public interface A01_BoardDao {
	public ArrayList<Board> boardList(Board sch);	
	public void insertBoard(Board insert);	
	public void uploadFile(BoardFile ins);
	public Board getBoard(int no);
	public ArrayList<BoardFile> fileInfo(int no);
	public void uptReadCnt(int no);
	public void updateBoard(Board upt);
	public void deleteBoard(Board del);
	public void updateFile(HashMap<String, String> hs);
}