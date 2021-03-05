package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jspexp.a03_database.A01_Dao;
import jspexp.a03_database.A02_DeptDao;
import jspexp.z01_vo.Dept;
import jspexp.z01_vo.Emp;

//springweb.a01_start.A02_EmpController
@Controller
public class A02_EmpController {
	// emp검색 처리
	// http://localhost:7080/springweb/empList.do
	@RequestMapping("/empList.do")
	public String empList(Emp sch, Model d) {
		// 여기서는 new를 사용하나, 나중에는 컨테이너에 탑재해서 하므로 new를 사용하지는 않음
		A01_Dao dao = new A01_Dao();
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		d.addAttribute("emplist", dao.empList(sch.getEname(), sch.getJob()));
		return "WEB-INF\\views\\a01_start\\a08_empList.jsp";
	}
}
