package springweb.a02_mvc.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	// http://localhost:7080/springweb/empDeptList.do
	@RequestMapping("/empDeptList.do")
	public String empDeptList(@ModelAttribute("sch") EmpDept sch, Model d) {
		d.addAttribute("empDeptList", service.schEDGList(sch));
		return "WEB-INF\\views\\a02_mvc\\a03_empDeptList.jsp";
	}

	
/* 공통 모델: CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST */	
	@ModelAttribute("jobs")
	public ArrayList<String> getJobs(){
		ArrayList<String> jobs = new ArrayList<String>();
		jobs.add("CLERK");
		jobs.add("SALESMAN");
		jobs.add("PRESIDENT");
		jobs.add("MANAGER");
		jobs.add("ANALYST");
		return jobs;
	}

/* 공통 모델: 10 ACCOUNTING, 20 RESEARCH, 30 SALES, 40 OPERATIONS */
	@ModelAttribute("depts")
	public ArrayList<Dept> getDepts(){
		ArrayList<Dept> depts = new ArrayList<Dept>();
		depts.add(new Dept(10, "ACCOUNTING", null));
		depts.add(new Dept(20, "RESEARCH", null));
		depts.add(new Dept(30, "SALES", null));
		depts.add(new Dept(40, "OPERATIONS", null));
		return depts;
	}

/* 공통 모델: 7566	JONES, 7782 CLARK, 7839 KING, 7698 BLAKE, 7902 FORD */
	@ModelAttribute("mgrs")
	public ArrayList<Emp> getMgrs(){
		ArrayList<Emp> mgrs = new ArrayList<Emp>();
		mgrs.add(new Emp(7566, "JONES"));
		mgrs.add(new Emp(7782, "CLARK"));
		mgrs.add(new Emp(7839, "KING"));
		mgrs.add(new Emp(7698, "BLAKE"));
		mgrs.add(new Emp(7902, "FORD"));
		return mgrs;
	}

}
