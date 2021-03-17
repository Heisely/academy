package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A01_EmpService;
import springweb.z02_vo.Emp;

@Controller
public class A03_AjaxController {
	@Autowired(required = false)
	private A01_EmpService service;
	
	// http://localhost:7080/springweb/ajaxStart.do
	@RequestMapping("ajaxStart.do")
	public String ajaxStart(Emp sch, Model d) {
		d.addAttribute("emp", service.emplist(sch));
		return "pageJsonReport";
	}
}
