package springweb.z02_vo;

import java.util.Date;

public class Emp {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate; // 가져올 날짜 데이터
	private double sal;
	private double comm;
	private int deptno;

	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Emp(int mgr) {
		super();
		this.mgr = mgr;
	}


	public Emp(int mgr, String ename) {
		super();
		this.ename = ename;
		this.mgr = mgr;
	}

	public Emp(String ename, String job, int mgr, double sal, double comm, int deptno) {
		super();
		this.ename = ename;
		this.job = job;
		this.mgr = mgr;
		this.sal = sal;
		this.comm = comm;
		this.deptno = deptno;
	}

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

}
