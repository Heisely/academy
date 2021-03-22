package board.a03_dao;

// board.a03_dao.A01_BoardDao
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.z01_vo.Board;

@Repository
public interface A01_BoardDao {
	public ArrayList<Board> boardList(Board sch);
	
	public void insertBoard(Board insert);
}