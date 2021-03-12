package springweb.z01_exp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z02_vo.Dept;

@Controller
public class Z02_DeptController {
	@Autowired(required=false)
	private Z02_DeptService service;
	
	// http://localhost:7080/springweb/deptListExp.do
	@RequestMapping("/deptListExp.do")
	public String deptListExp(@ModelAttribute("sch") Dept sch, Model d) {
		System.out.println("데이터 건수: "+service.deptListExp(sch).size());
		d.addAttribute("deptList", service.deptListExp(sch));
		return "a01_exp\\03_self\\a07_0312.jsp";
	}
}
