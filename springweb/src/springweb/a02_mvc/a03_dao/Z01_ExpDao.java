package springweb.a02_mvc.a03_dao;

import java.util.ArrayList;
import java.util.HashMap;

import springweb.z02_vo.Dept;
import springweb.z02_vo.Emp;
import springweb.z03_vo.EmpDept;
import springweb.z03_vo.EmpGrade;
import springweb.z03_vo.EmpPart;
import springweb.z03_vo.FileVo;

// springweb.a02_mvc.a03_dao.Z01_ExpDao
public interface Z01_ExpDao {
	public ArrayList<Dept> deptList(Dept sch);
	public ArrayList<EmpGrade> empGrade(double d);
	public ArrayList<Emp> empSch2(HashMap<String,Double> hs);
	public ArrayList<EmpPart> empSch3(HashMap<String,String> hs);
    public ArrayList<EmpDept> empSch4(int deptno);
    public ArrayList<String> empMgrSch(String ename);
    public double emgMaxSal(ArrayList<String> enames);
    public ArrayList<Emp> empSch5(String year);
    
    // 파일 업로드 처리
    public void insertFile(FileVo ins);
}
