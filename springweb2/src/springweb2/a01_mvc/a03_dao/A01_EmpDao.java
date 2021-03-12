package springweb2.a01_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb2.a01_mvc.z01_vo.Dept;
import springweb2.a01_mvc.z01_vo.Emp;

@Repository
public interface A01_EmpDao {
	// springweb2.a01_mvc.a03_dao.A01_EmpDao
	public ArrayList<Emp> empList(Emp sch);
	// ex) mybatis.Spring.xml, EmpMapper.xml
	public ArrayList<Dept> deptList(Dept sch);
}
