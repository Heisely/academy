package springweb.a02_mvc.a03_dao;

import java.util.ArrayList;
import java.util.HashMap;

import springweb.z02_vo.Dept;
import springweb.z02_vo.Emp;
import springweb.z02_vo.Emp2;
import springweb.z03_vo.EmpDept;
// springweb.a02_mvc.a03_dao.A01_EmpDao: namespace
// emplist: id
// ArrayList<Emp>(returnType): resultMap
// (Emp sch): resultType
public interface A01_EmpDao {
	// 여기에 있는 구성요소 하나하나가 EmpMapper.xml에 있는 구성요소와 연동해서 MyBatis 프레임워크에서 실제 객체를 생성해준다.
	public ArrayList<Emp> emplist(Emp sch);
//	InsertDao
	public void empInsert(Emp dto);
	

	/*
	# dao, mapper 연습예제
	ex1) SELECT count(*) FROM emp;
	 */
	public int totCnt();
	/*
	ex2) SELECT * FROM emp
		 WHERE empno = #{empno};
	 */
	public Emp getEmp(int empno);
	/*
	-- ex3) SELECT empno FROM emp
			WHERE sal BETWEEN #{start} AND #{end};
	 */
	public ArrayList<Emp2> searchEmp1(Emp2 sch);
	public ArrayList<Integer> searchEmp2(Emp2 sch);
	public ArrayList<Integer> searchEmp3(HashMap<String, Integer> hm);
	
//	ex1) SELECT * FROM dept WHERE deptno=#{deptno};
	public Dept getDept(int deptno);
//	ex2) SELECT deptno, max(sal) sal FROM emp GROUP BY deptno
	public ArrayList<Emp> maxSal();
//	ex3) SELECT * FROM emp WHERE job = #{job}
	public ArrayList<Emp> searchJob(String job);
//	ex4) SELECT max(sal) FROM emp WHERE deptno = ${deptno}
	public int maxSalDeptno(int deptno);
	
//	0312 과제
	public ArrayList<EmpDept> schEDGList(EmpDept sch);
	
//	0315 과제	
	public ArrayList<Dept> getDepts();
	public ArrayList<Emp> getMgrs();
	public ArrayList<String> getJobs();
}
