package springweb2.a01_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb2.a01_mvc.a02_service.A01_EmpService;
import springweb2.a01_mvc.z01_vo.Emp;

@Controller
public class A01_EmpController {
	@Autowired(required = false)
	private A01_EmpService service;
	
	// http://localhost:7080/springweb2/empList.do
	@RequestMapping("empList.do")
	public String empList(@ModelAttribute("sch") Emp sch, Model d) {
		d.addAttribute("empList", service.empList(sch));
		return "WEB-INF\\views\\a01_mvc\\a01_empList.jsp";
	}
}
