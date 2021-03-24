package board.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import board.a02_service.A01_BoardService;
import board.z01_vo.Board;
import board.z01_vo.Member;

@Controller
@RequestMapping("board.do")
public class A01_BoardController {
	@Autowired(required = false)
	private A01_BoardService service;

	// http://localhost:7080/board/board.do?method=list
	@RequestMapping(params = "method=list")
	public String boardList(@ModelAttribute("sch") Board sch, Model d, HttpServletRequest request) {
		// session 설정
		HttpSession session = request.getSession();
		session.setAttribute("mem", new Member("himan","7777"));
		
		d.addAttribute("boardList", service.boardList(sch));

		return "a01_boardList";
	}

	// http://localhost:7080/board/board.do?method=insForm
	@RequestMapping(params = "method=insForm")
	public String insForm() {
		return "a02_boardInsert";
	}

	// http://localhost:7080/board/board.do?method=insert
	@RequestMapping(params = "method=insert")
	public String insertBoard(Board insert) {
		System.out.println("등록: " + insert.getSubject());
		// 파일 전송 여부 확인
		System.out.println("파일: "+insert.getReport()[0].getOriginalFilename());
		
		service.insertBoard(insert);
		return "a02_boardInsert";
	}
	
	// http://localhost:7080/board/board.do?method=detail
	// http://localhost:7080/board/board.do?method=update
	// http://localhost:7080/board/board.do?method=delete
}
