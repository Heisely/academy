package springdi.z00_exp.z01_vo;

public class Emp {
	private String name;

	public Emp() {
		super();
		name = "홍길동(기본 사원)";
		// TODO Auto-generated constructor stub
	}

	public Emp(String name) {
		super();
		this.name = name;
	}

	public void info() {
		System.out.println("이름(직원): "+name);
	}

}
