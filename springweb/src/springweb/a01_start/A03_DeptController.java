package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jspexp.a03_database.A02_DeptDao;
import jspexp.z01_vo.Dept;

@Controller
public class A03_DeptController {
	// ex) http://localhost:7080/springweb/deptList.do
	// 부서정보 조회
	@RequestMapping("/deptList.do")
	public String deptList(Dept dept, Model d) {
		A02_DeptDao dao = new A02_DeptDao();
		if(dept.getDname()==null) dept.setDname("");
		if(dept.getLoc()==null) dept.setLoc("");
		d.addAttribute("dlist",dao.deptList(dept));
		return "WEB-INF\\views\\a01_start\\a09_deptList.jsp";
	}
}
