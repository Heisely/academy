package springweb.z01_exp;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.z02_vo.Dept;

@Service
public class Z02_DeptService {
	@Autowired(required=false)
	private Z02_DeptDao dao;
	
	public ArrayList<Dept> deptListExp(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.deptList(sch);
	}
}
