package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A04_CalenService;

@Controller
@RequestMapping("calendar.do")
public class A04_CalendarController {
	@Autowired(required = false)
	private A04_CalenService service;
	
	// http://localhost:7080/springweb/calendar.do?method=list
	@GetMapping(params = "method=list")
	public String list() {
		return "WEB-INF\\views\\a03_ajax\\a04_fullcalendar.jsp";
	}
//	ex) a01_start/A08_CalendarCtrl.java를 생성.
//		WEB-INF\views\a01_start\a17_calendarExp.jsp 호출.
//		오늘 날짜 기준으로 화면 출력
	
	// http://localhost:7080/springweb/calendar.do?method=data
	@GetMapping(params = "method=data")
	public String data(Model d) {
		d.addAttribute("list", service.calenList());
		return "pageJsonReport";
	}
}
