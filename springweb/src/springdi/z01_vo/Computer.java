package springdi.z01_vo;
// springdi.z01_vo.Computer
public class Computer {
	private String name;
	private Cpu cpu;
	private Ram ram;
	private Hdd hdd;

	public Computer() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Computer(String name) {
		super();
		this.name = name;
	}

	public void showInfo() {
		System.out.println("컴퓨터명 " + name + "에 포함된 ");
		if (cpu != null && ram != null && hdd != null) {
			System.out.println("CPU 이름은 " + cpu.getName() + ", 사양은 " + cpu.getSpec());
			System.out.println("RAM 이름은 " + ram.getName() + ", 사양은 " + ram.getSpec());
			System.out.println("HDD 이름은 " + hdd.getName() + ", 사양은 " + hdd.getSpec());
			System.out.println("입니다.");
		} else {
			System.out.println("부품의 정보를 정확히 파악할 수 없습니다.");
		}
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Hdd getHdd() {
		return hdd;
	}

	public void setHdd(Hdd hdd) {
		this.hdd = hdd;
	}
	
}
