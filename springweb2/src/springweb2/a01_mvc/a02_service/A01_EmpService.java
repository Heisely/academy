package springweb2.a01_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb2.a01_mvc.a03_dao.A01_EmpDao;
import springweb2.a01_mvc.z01_vo.Dept;
import springweb2.a01_mvc.z01_vo.Emp;

@Service
public class A01_EmpService {
	@Autowired(required = false)
	private A01_EmpDao dao;
	public ArrayList<Emp> empList(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		return dao.empList(sch);
	}
}
