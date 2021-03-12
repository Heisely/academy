package springweb.a02_mvc.a02_service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A01_EmpDao;
import springweb.z02_vo.Emp;

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


		return dao.emplist(sch);
	}
}
