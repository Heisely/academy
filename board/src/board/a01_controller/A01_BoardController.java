package board.a01_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		session.setAttribute("mem", new Member("himan", "7777"));

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
		System.out.println("파일: " + insert.getReport()[0].getOriginalFilename());

		service.insertBoard(insert);
		return "a02_boardInsert";
	}

	// http://localhost:7080/board/board.do?method=detail
	// 상세화면
	@RequestMapping(params = "method=detail")
	public String detail(@RequestParam("no") int no, Model d) {
		System.out.println("no: " + no);
		d.addAttribute("board", service.getBoard(no));

		return "a03_boardDetail";
	}

	// http://localhost:7080/board/board.do?method=update
	@RequestMapping(params = "method=update")
	public String update(Board upt) {		
		service.updateBoard(upt);		
		// 수정 key인 no를 넘겨줘야 되기 떄문에 forward
		return "forward:/board.do?method=detail";
		// 수정 후 다시 조회 할 수 있게 하기 위해 forward로 해당 controller 메서드 호출
	}
	
	// http://localhost:7080/board/board.do?method=delete
	@RequestMapping(params = "method=delete")
	public String delete(Board del) {
		service.deleteBoard(del);
		
		return "forward:/board.do?method=list";
	}
	// http://loaclhost:7080/board/board.do?method=download
	// 화면단 클릭 시, http://loaclhost:7080/board/board.do?method=download&fname=파일명으로 전송
	@RequestMapping(params = "method=download")
	public String download(@RequestParam("fname") String fname, Model d) {
		System.out.println("파일명: " + fname);
		d.addAttribute("downloadFile", fname); // viewer안에 선언한 모델
		// 컨테이너 안에 있는 viewer명
		return "downloadviewer";
	}
}
