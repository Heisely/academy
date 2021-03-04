package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// dispatcher-servlet.xml에서 등록해야 한다.
// springweb.a01_start.A01_StartController
@Controller
public class A01_StartController {
	// http://localhost:7080/springweb: 확인 초기 페이지 로딩
	// http://localhost:7080/springweb/start.do
	@RequestMapping("/start.do")
	public String start() {
		// View 호출
		return "WEB-INF\\views\\a01_start\\a01_springStart.jsp";
	}
	
	@RequestMapping("/start2.do")
	public String start2() {
		return "WEB-INF\\views\\z01_exp\\a01_exp01.jsp";
	}
}
