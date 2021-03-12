package springweb.a02_mvc.a03_dao;

import java.util.ArrayList;

import springweb.z02_vo.Emp;
// springweb.a02_mvc.a03_dao.A01_EmpDao: namespace
// emplist: id
// ArrayList<Emp>(returnType): resultMap
// (Emp sch): resultType
public interface A01_EmpDao {
	// 여기에 있는 구성요소 하나하나가 EmpMapper.xml에 있는 구성요소와 연동해서 MyBatis 프레임워크에서 실제 객체를 생성해준다.
	public ArrayList<Emp> emplist(Emp sch);
}
