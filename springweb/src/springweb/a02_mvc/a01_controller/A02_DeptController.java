package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A02_DeptService;
import springweb.z02_vo.Dept;

@Controller
public class A02_DeptController {
	@Autowired(required = false)
	private A02_DeptService service;
	
	// http://localhost:7080/springweb/dept.do
	@RequestMapping("dept.do")
	public String dept(@ModelAttribute("sch") Dept sch, Model d) {
		System.out.println("데이터 건수: "+service.deptList(sch).size());
		d.addAttribute("deptList", service.deptList(sch));
		return "WEB-INF\\views\\a02_mvc\\a02_deptList.jsp";
	}
}
