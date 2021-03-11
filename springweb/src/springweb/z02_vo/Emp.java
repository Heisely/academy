package springweb.z02_vo;

public class Emp {
	private String ename;
	private String job;

	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Emp(String ename, String job) {
		super();
		this.ename = ename;
		this.job = job;
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

}
