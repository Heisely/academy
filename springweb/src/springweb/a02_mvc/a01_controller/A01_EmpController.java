package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A01_EmpService;
import springweb.z02_vo.Emp;

@Controller
public class A01_EmpController {
	@Autowired(required=false)
	private A01_EmpService service;
	
	// http://localhost:7080/springweb/empList2.do
	@RequestMapping("/empList2.do")
	public String empList2(Emp sch, Model d) {
		System.out.println("데이터 건수: "+service.emplist(sch).size());
		d.addAttribute("emplist", service.emplist(sch));
		return "WEB-INF\\views\\a02_mvc\\a01_empList.jsp";
	}
}
