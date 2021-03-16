package springweb.a02_mvc.a02_service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A01_EmpDao;
import springweb.z02_vo.Dept;
import springweb.z02_vo.Emp;
import springweb.z03_vo.EmpDept;

@Service
public class A01_EmpService {
	@Autowired(required = false)
	private A01_EmpDao dao;

	public ArrayList<Emp> emplist(Emp sch) {
		if (sch.getEname() == null)
			sch.setEname("");
		if (sch.getJob() == null)
			sch.setJob("");

		System.out.println("## 데이터 건수: " + dao.totCnt());
		System.out.println("## 데이터 객체: " + dao.getEmp(7499).getEname());

		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("start", 1000);
		hm.put("end", 3000);

		System.out.println("## 검색된 사원 번호 ##");
		for (int empno : dao.searchEmp3(hm)) {
			System.out.println(empno);
		}
//		dao.schEDGList(new EmpDept()); // test용 -> 정상작동 확인
//		dao.empInsert(new Emp("김길동(연습)", "CLERK", 7902,4000,200,10));
//		dao.getMgrs();

		return dao.emplist(sch);
	}

	public void empInsert(Emp dto) {
		dao.empInsert(dto);
	}
	
	public ArrayList<EmpDept> schEDGList(EmpDept sch) {

		return dao.schEDGList(sch);
	}

	public ArrayList<Dept> getDepts(){
		return dao.getDepts();
	}
	
	public ArrayList<Emp> getMgrs() {
		return dao.getMgrs();
	}

	public ArrayList<String> getJobs() {
		return dao.getJobs();
	}

}
