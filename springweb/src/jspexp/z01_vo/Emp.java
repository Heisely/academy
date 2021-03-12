package jspexp.z01_vo;

import java.util.Date;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate; // 가져올 날짜 데이터
	private String hiredate_s; // 입력할 날짜 데이터
	private double sal;
	private double comm;
	private int deptno;
	private String dname;

	// default 생성자
	public Emp() {
		super();
	}

	public Emp(int deptno, Date hiredate, double sal) {
		super();
		this.deptno = deptno;
		this.hiredate = hiredate;
		this.sal = sal;
	}

	// mgrList를 위한 생성자
	public Emp(int mgr, String ename) {
		super();
		this.mgr = mgr;
		this.ename = ename;
	}

	public Emp(int empno, String ename, String job, int mgr, String hiredate_s, double sal, double comm, int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate_s = hiredate_s;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

	// 전체 매개변수가 있는 생성자
	public Emp(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

	// dname 추가 생성자(spring)
	private String mname;

	public Emp(int empno, String ename, String job, int mgr, Date hiredate, double sal, double comm, int deptno,
			String dname, String mname) {
		super();
		this.empno = empno;
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.hiredate = hiredate;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
		this.dname = dname;
		this.mname = mname;
	}

	public String getHiredate_s() {
		return hiredate_s;
	}

	public void setHiredate_s(String hiredate_s) {
		this.hiredate_s = hiredate_s;
	}

	// 검색에 필요한 매개변수 ename, job이 있는 생성자
	public Emp(String ename, String job) {
		super();
		this.ename = ename;
		this.job = job;
	}

	// setXXX(), getXXX()
	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}

	public double getSal() {
		return sal;
	}

	public void setSal(double sal) {
		this.sal = sal;
	}

	public double getComm() {
		return comm;
	}

	public void setComm(double comm) {
		this.comm = comm;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
}
