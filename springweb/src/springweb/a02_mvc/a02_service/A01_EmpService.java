package springweb.a02_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A01_EmpDao;
import springweb.z02_vo.Emp;

@Service
public class A01_EmpService {
	@Autowired(required=false)
	private A01_EmpDao dao;
	public ArrayList<Emp> emplist(Emp sch){
		return dao.emplist(sch);
	}
}
