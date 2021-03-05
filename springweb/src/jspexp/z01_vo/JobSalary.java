package jspexp.z01_vo;

public class JobSalary {
	private String job;
	private int cnt;
	private int avg;

	public JobSalary() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobSalary(String job, int cnt, int avg) {
		super();
		this.job = job;
		this.cnt = cnt;
		this.avg = avg;
	}

	

	public JobSalary(int avg) {
		super();
		this.avg = avg;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCount(int cnt) {
		this.cnt = cnt;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

}
