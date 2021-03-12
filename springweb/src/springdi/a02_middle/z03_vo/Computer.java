package springdi.a02_middle.z03_vo;

import org.springframework.beans.factory.annotation.Autowired;

public class Computer {
	private String company;
	
	// required=false
	// 만일 컨테이너에 객체가 있다면, autowiring으로 객체를 할당한다.
	@Autowired(required=false)
	private Cpu cpu;
	@Autowired(required=false)
	private Ram ram;
	@Autowired(required=false)
	private Ssd ssd;

	public Computer() {
		super();
		company = "조립컴퓨터(기본옵션)";
		// TODO Auto-generated constructor stub
	}

	public Computer(String company) {
		super();
		this.company = company;
	}

	public void info() {
		System.out.println("컴퓨터의 제조사: " + company);
		if (cpu != null) cpu.info();
		if (ram != null) ram.info();
		if (ssd != null) ssd.info();
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public Cpu getCpu() {
		return cpu;
	}

	public void setCpu(Cpu cpu) {
		this.cpu = cpu;
	}

	public Ram getRam() {
		return ram;
	}

	public void setRam(Ram ram) {
		this.ram = ram;
	}

	public Ssd getSsd() {
		return ssd;
	}

	public void setSsd(Ssd ssd) {
		this.ssd = ssd;
	}

}
