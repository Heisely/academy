package springweb.a02_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A02_DeptDao;
import springweb.z02_vo.Dept;

@Service
public class A02_DeptService {
	@Autowired(required = false)
	private A02_DeptDao dao;
	
	public ArrayList<Dept> deptList(Dept sch){
		if(sch.getDname()==null)
			sch.setDname("");
		if(sch.getLoc()==null)
			sch.setLoc("");
		
		return dao.deptList(sch);
	}
}
