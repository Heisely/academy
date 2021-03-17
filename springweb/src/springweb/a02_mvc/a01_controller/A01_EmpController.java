package springweb.a02_mvc.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A01_EmpService;
import springweb.z02_vo.Dept;
import springweb.z02_vo.Emp;
import springweb.z03_vo.EmpDept;

@Controller
public class A01_EmpController {
	@Autowired(required=false)
	private A01_EmpService service;
	
	// http://localhost:7080/springweb/empList2.do
	@RequestMapping("/empList2.do")
	public String empList2(@ModelAttribute("sch") Emp sch, Model d) {
		System.out.println("데이터 건수: "+service.emplist(sch).size());
		d.addAttribute("emplist", service.emplist(sch));
		return "WEB-INF\\views\\a02_mvc\\a01_empList.jsp";
	}

	// http://localhost:7080/springweb/insEmpForm.do
//	@RequestMapping("/insEmpForm.do")
	@GetMapping("/insEmpForm.do") // 5.0이후 지원. get방식 전송과 함께 선언
	public String insEmpForm(@ModelAttribute("emp") Emp ins) {
		return "WEB-INF\\views\\a02_mvc\\a01_empInsertForm.jsp";
	}	
	
//	@RequestMapping("/insertEmp.do")
	@PostMapping("/insertEmp.do") // 5.0이후 지원. post방식 전송 명시 처리
	public String insertEmp(@ModelAttribute("emp") Emp ins) {
		System.out.println("# 등록 처리: "+ins.getEname());
		service.empInsert(ins);
		return "WEB-INF\\views\\a02_mvc\\a01_empInsertForm.jsp";
	}
	
	// http://localhost:7080/springweb/empDeptList.do
	@RequestMapping("/empDeptList.do")
	public String empDeptList(@ModelAttribute("sch") EmpDept sch, Model d) {
		d.addAttribute("empDeptList", service.schEDGList(sch));
		return "WEB-INF\\views\\a02_mvc\\a03_empDeptList.jsp";
	}
	

/* EmpController를 처리하는 모든 url이 매핑된 메서드의 view단은 아래의 모델어트리뷰트를 공유한다. */
	/* 공통 모델: CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST */	
	@ModelAttribute("jobs")
	public ArrayList<String> getJobs(){
		return service.getJobs();
	}

	/* 공통 모델: 10 ACCOUNTING, 20 RESEARCH, 30 SALES, 40 OPERATIONS */
	@ModelAttribute("depts")
	public ArrayList<Dept> getDepts(){
		return service.getDepts();
	}

	/* 공통 모델: 7566	JONES, 7782 CLARK, 7839 KING, 7698 BLAKE, 7902 FORD */
	@ModelAttribute("mgrs")
	public ArrayList<Emp> getMgrs(){
		return service.getMgrs();
	}

}
